#!/usr/bin/env python3
"""Generate and execute facility-name updates from workbook for MySQL.

Execution commands:
- No commit (dry-run):
  ./.venv/bin/python src/run_facility_name_update_sql.py --target staging
- With commit (apply):
  ./.venv/bin/python src/run_facility_name_update_sql.py --target staging --apply
- For production, replace `staging` with `production`.
"""

from __future__ import annotations

import argparse
import os
import re
from dataclasses import dataclass
from pathlib import Path

import pymysql
from dotenv import load_dotenv
from openpyxl import load_workbook

# Sheet-level contract: this script only reads one worksheet and these columns.
SHEET_NAME = "facility_name_variations"
EXPECTED_HEADER = (
    "facility_name (Database)",
    "Correct MFL",
    "Correct MFL Name",
    "Coment",
)

# Update these names if your .env keys are renamed later.
ENV_KEYS = {
    "staging": {
        "host": "PDS_STG_DATABASE_HOST",
        "database": "PDS_STG_DATABASE_NAME",
        "user": "PDS_STG_USERNAME",
        "password": "PDS_STG_PASSWORD",
        "port": "PDS_STG_DATABASE_PORT",
    },
    "production": {
        "host": "PDS_DATABASE_HOST",
        "database": "PDS_DATABASE_NAME",
        "user": "PDS_DELIVERIES_DATABASE_USERNAME",
        "password": "PDS_DELIVERIES_DATABASE_PASSWORD",
        "port": "PDS_DATABASE_PORT",
    },
}


@dataclass(frozen=True)
class FacilityRow:
    source_name: str
    mfl_code: int
    target_name: str


def normalize_name(value: str) -> str:
    # Text normalization avoids false mismatches from inconsistent spacing.
    return " ".join(str(value).split()).strip()


def sql_string(value: str) -> str:
    return "'" + value.replace("'", "''") + "'"


def validate_table_name(table_name: str) -> str:
    # Identifiers are injected into SQL text, so keep allowed characters strict.
    if not re.match(r"^[A-Za-z0-9_.]+$", table_name):
        raise ValueError(f"Invalid table name: {table_name}")
    return table_name


def validate_column_name(column_name: str) -> str:
    # Identifiers are injected into SQL text, so keep allowed characters strict.
    if not re.match(r"^[A-Za-z0-9_]+$", column_name):
        raise ValueError(f"Invalid column name: {column_name}")
    return column_name


def load_rows(workbook_path: Path) -> list[FacilityRow]:
    # Input validation stays strict so broken workbook structure fails early.
    wb = load_workbook(workbook_path, data_only=True)
    if SHEET_NAME not in wb.sheetnames:
        raise ValueError(f"Sheet '{SHEET_NAME}' not found in {workbook_path}")

    ws = wb[SHEET_NAME]
    header = tuple(cell.value for cell in ws[1])
    if header[:4] != EXPECTED_HEADER:
        raise ValueError(f"Unexpected header: {header[:4]}")

    rows: list[FacilityRow] = []
    for excel_row, raw in enumerate(ws.iter_rows(min_row=2, values_only=True), start=2):
        source_name, mfl_code, target_name = raw[:3]
        if source_name is None and mfl_code is None and target_name is None:
            continue
        if source_name is None or mfl_code is None or target_name is None:
            raise ValueError(f"Missing required value at row {excel_row}")

        rows.append(
            FacilityRow(
                source_name=str(source_name),
                mfl_code=int(mfl_code),
                target_name=str(target_name),
            )
        )
    return rows


def build_sql(
    mapping: list[tuple[int, str, str]],
    table_name: str,
    name_column: str,
    code_column: str,
    target: str,
    apply: bool,
) -> str:
    # Emit plain MySQL statements so the file can be reviewed/executed manually.
    lines = [
        "-- Facility cleanup SQL (name + government_facility_code).",
        f"-- Target: {target}",
        "-- No commit (dry-run): ./.venv/bin/python src/run_facility_name_update_sql.py --target staging",
        "-- With commit (apply): ./.venv/bin/python src/run_facility_name_update_sql.py --target staging --apply",
        "-- For production, replace `staging` with `production`.",
        "",
        "START TRANSACTION;",
        "",
    ]
    for mfl_code, source_name, target_name in mapping:
        mfl_text = str(mfl_code)
        if source_name == target_name:
            # Code-only row: canonical name already matches, only MFL sync is needed.
            lines.append(f"UPDATE {table_name}")
            lines.append(f"SET {code_column} = {sql_string(mfl_text)}")
            lines.append(
                "WHERE "
                f"BINARY {name_column} = BINARY {sql_string(target_name)} "
                f"AND COALESCE({code_column}, '') <> {sql_string(mfl_text)};"
            )
            lines.append("")
            continue

        # Pass 1: rename source->target and set MFL code.
        lines.append(f"UPDATE {table_name}")
        lines.append(
            f"SET {name_column} = {sql_string(target_name)}, "
            f"{code_column} = {sql_string(mfl_text)}"
        )
        lines.append(
            "WHERE "
            f"BINARY {name_column} = BINARY {sql_string(source_name)} "
            f"AND (BINARY {name_column} <> BINARY {sql_string(target_name)} "
            f"OR COALESCE({code_column}, '') <> {sql_string(mfl_text)});"
        )
        lines.append("")

        # Pass 2: if target name already exists, still enforce the MFL code.
        lines.append(f"UPDATE {table_name}")
        lines.append(f"SET {code_column} = {sql_string(mfl_text)}")
        lines.append(
            "WHERE "
            f"BINARY {name_column} = BINARY {sql_string(target_name)} "
            f"AND COALESCE({code_column}, '') <> {sql_string(mfl_text)};"
        )
        lines.append("")

    lines.append("COMMIT;" if apply else "ROLLBACK;")
    lines.append("")
    return "\n".join(lines)


def build_connection_from_env(target: str, dotenv_path: Path) -> dict[str, object]:
    config = ENV_KEYS[target]
    # Load .env file if present. Existing shell env vars are not overridden.
    load_dotenv(dotenv_path, override=False)

    required = ("host", "database", "user", "password")
    missing = [config[key] for key in required if not os.environ.get(config[key])]
    if missing:
        raise ValueError(f"Missing required variables: {', '.join(missing)}")

    connection: dict[str, object] = {
        "host": os.environ[config["host"]],
        "database": os.environ[config["database"]],
        "user": os.environ[config["user"]],
        "password": os.environ[config["password"]],
        "charset": "utf8mb4",
        "autocommit": False,
    }
    port_key = config.get("port")
    if port_key and os.environ.get(port_key):
        connection["port"] = int(os.environ[port_key])

    return connection


def execute_updates(
    connection: pymysql.connections.Connection,
    mapping: list[tuple[int, str, str]],
    table_name: str,
    name_column: str,
    code_column: str,
    apply: bool,
) -> tuple[int, dict[str, object]]:
    # Pass 1 query: rename source->target and set MFL code.
    query_rename_and_code = (
        f"UPDATE {table_name} "
        f"SET {name_column} = %s, {code_column} = %s "
        f"WHERE BINARY {name_column} = BINARY %s "
        f"AND (BINARY {name_column} <> BINARY %s OR COALESCE({code_column}, '') <> %s)"
    )
    # Pass 2 query: keep target rows aligned on MFL code.
    query_target_code_only = (
        f"UPDATE {table_name} "
        f"SET {code_column} = %s "
        f"WHERE BINARY {name_column} = BINARY %s "
        f"AND COALESCE({code_column}, '') <> %s"
    )
    query_name_count = (
        f"SELECT COUNT(*) FROM {table_name} "
        f"WHERE BINARY {name_column} = BINARY %s"
    )
    query_code_only = (
        f"UPDATE {table_name} "
        f"SET {code_column} = %s "
        f"WHERE BINARY {name_column} = BINARY %s "
        f"AND COALESCE({code_column}, '') <> %s"
    )

    stats: dict[str, object] = {
        "unresolved_mappings": 0,
        "source_multi_match_mappings": 0,
        "target_multi_match_mappings": 0,
        "unresolved_examples": [],
    }
    rows_updated = 0
    with connection.cursor() as cursor:
        for mfl_code, source_name, target_name in mapping:
            mfl_text = str(mfl_code)

            cursor.execute(query_name_count, (source_name,))
            source_count = int((cursor.fetchone() or [0])[0])
            target_count = source_count
            if source_name != target_name:
                cursor.execute(query_name_count, (target_name,))
                target_count = int((cursor.fetchone() or [0])[0])

            if source_count == 0 and target_count == 0:
                stats["unresolved_mappings"] += 1
                if len(stats["unresolved_examples"]) < 5:
                    stats["unresolved_examples"].append(
                        {"mfl_code": mfl_text, "source_name": source_name, "target_name": target_name}
                    )
            if source_count > 1:
                stats["source_multi_match_mappings"] += 1
            if target_count > 1:
                stats["target_multi_match_mappings"] += 1

            if source_name == target_name:
                cursor.execute(query_code_only, (mfl_text, target_name, mfl_text))
                rows_updated += int(cursor.rowcount)
                continue

            cursor.execute(
                query_rename_and_code,
                (target_name, mfl_text, source_name, target_name, mfl_text),
            )
            rows_updated += int(cursor.rowcount)
            cursor.execute(query_target_code_only, (mfl_text, target_name, mfl_text))
            rows_updated += int(cursor.rowcount)

    if apply:
        connection.commit()
    else:
        connection.rollback()
    return rows_updated, stats


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--workbook", default="data/Data Cleanup_02062026.xlsx")
    parser.add_argument("--sql-output", default="data/facility_name_update_staging.sql")
    parser.add_argument("--dotenv", default=".env")
    parser.add_argument("--target", choices=("staging", "production"), default="staging")
    parser.add_argument("--table", default="facilities")
    parser.add_argument("--name-column", default="facility_name")
    parser.add_argument("--code-column", default="government_facility_code")
    parser.add_argument(
        "--apply",
        action="store_true",
        help="Persist changes. Without this flag, the script runs in dry-run mode.",
    )
    parser.add_argument(
        "--skip-db",
        action="store_true",
        help="Only generate SQL file and skip database execution.",
    )
    args = parser.parse_args()

    table_name = validate_table_name(args.table)
    name_column = validate_column_name(args.name_column)
    code_column = validate_column_name(args.code_column)

    # 1) Read the source sheet and keep all mappings.
    rows = load_rows(Path(args.workbook))
    rename_count = sum(
        1 for row in rows if normalize_name(row.source_name) != normalize_name(row.target_name)
    )

    # De-dupe protects SQL from repeated rows in the source sheet.
    # Sorting by source name keeps SQL aligned with workbook review order.
    mapping = sorted(
        {(row.mfl_code, row.source_name, row.target_name) for row in rows},
        key=lambda item: (normalize_name(item[1]).casefold(), item[0]),
    )
    sql_text = build_sql(
        mapping,
        table_name=table_name,
        name_column=name_column,
        code_column=code_column,
        target=args.target,
        apply=args.apply,
    )

    # 2) Persist SQL artifact for auditability and manual verification.
    sql_output_path = Path(args.sql_output)
    sql_output_path.parent.mkdir(parents=True, exist_ok=True)
    sql_output_path.write_text(sql_text, encoding="utf-8")
    print(f"Sheet rows: {len(rows)}")
    print(f"Rename-required rows: {rename_count}")
    print(f"SQL mappings: {len(mapping)}")
    print(f"SQL file: {sql_output_path}")
    print(f"Target: {args.target}")
    print(f"Mode: {'APPLY' if args.apply else 'DRY-RUN'}")

    if args.skip_db:
        return

    # 3) Execute against selected target DB.
    connection_settings = build_connection_from_env(args.target, Path(args.dotenv))
    with pymysql.connect(**connection_settings) as connection:
        rows_updated, stats = execute_updates(
            connection=connection,
            mapping=mapping,
            table_name=table_name,
            name_column=name_column,
            code_column=code_column,
            apply=args.apply,
        )

    print(f"rows_updated: {rows_updated}")
    print(f"unresolved_mappings: {stats['unresolved_mappings']}")
    print(f"source_multi_match_mappings: {stats['source_multi_match_mappings']}")
    print(f"target_multi_match_mappings: {stats['target_multi_match_mappings']}")
    unresolved_examples = stats.get("unresolved_examples", [])
    if unresolved_examples:
        print("unresolved_examples:")
        for row in unresolved_examples:
            print(
                f"  mfl={row['mfl_code']} source={row['source_name']} "
                f"target={row['target_name']}"
            )


if __name__ == "__main__":
    main()
