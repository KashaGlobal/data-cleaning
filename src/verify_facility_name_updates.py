#!/usr/bin/env python3
"""Verify facility-name updates by counting pending rename/code mappings.

Execution commands:
- ./.venv/bin/python src/verify_facility_name_updates.py --target staging
- For production, replace `staging` with `production`.
"""

from __future__ import annotations

import argparse
import csv
import os
import re
from dataclasses import dataclass
from pathlib import Path

import pymysql
from dotenv import load_dotenv
from openpyxl import load_workbook

# Sheet-level contract: verification is driven by the same source sheet as updates.
SHEET_NAME = "facility_name_variations"
EXPECTED_HEADER = (
    "facility_name (Database)",
    "Correct MFL",
    "Correct MFL Name",
    "Coment",
)

# Update these key names if .env naming changes.
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
    # Keep comparisons robust to accidental spacing differences in source data.
    return " ".join(str(value).split()).strip()


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


def build_connection_from_env(target: str, dotenv_path: Path) -> dict[str, object]:
    # Load .env if present; shell-exported values are kept as highest priority.
    load_dotenv(dotenv_path, override=False)
    config = ENV_KEYS[target]

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
        "autocommit": True,
    }
    port_key = config.get("port")
    if port_key and os.environ.get(port_key):
        connection["port"] = int(os.environ[port_key])

    return connection


def write_csv(path: Path, rows: list[dict[str, object]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as file_obj:
        writer = csv.DictWriter(
            file_obj,
            fieldnames=[
                "mfl_code",
                "current_name",
                "target_name",
                "source_name_rows",
                "target_name_rows_with_code",
                "target_name_rows_any_code",
                "status",
            ],
        )
        writer.writeheader()
        writer.writerows(rows)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--workbook", default="data/Data Cleanup_02062026.xlsx")
    parser.add_argument("--dotenv", default=".env")
    parser.add_argument("--target", choices=("staging", "production"), default="staging")
    parser.add_argument("--table", default="facilities")
    parser.add_argument("--name-column", default="facility_name")
    parser.add_argument("--code-column", default="government_facility_code")
    parser.add_argument(
        "--output",
        default="data/facility_name_update_verification.csv",
        help="CSV of mappings that still need rename/code cleanup.",
    )
    args = parser.parse_args()

    table_name = validate_table_name(args.table)
    name_column = validate_column_name(args.name_column)
    code_column = validate_column_name(args.code_column)

    # Build the same mapping scope used by the update script (all sheet rows).
    rows = load_rows(Path(args.workbook))
    mapping = sorted(
        {(row.mfl_code, row.source_name, row.target_name) for row in rows},
        key=lambda item: (normalize_name(item[1]).casefold(), item[0]),
    )

    if not mapping:
        print("No mappings found in workbook.")
        return

    connection = build_connection_from_env(args.target, Path(args.dotenv))

    source_count_query = (
        f"SELECT COUNT(*) AS cnt FROM {table_name} "
        f"WHERE BINARY {name_column} = BINARY %s"
    )
    target_with_code_query = (
        f"SELECT COUNT(*) AS cnt FROM {table_name} "
        f"WHERE BINARY {name_column} = BINARY %s AND COALESCE({code_column}, '') = %s"
    )
    target_any_query = (
        f"SELECT COUNT(*) AS cnt FROM {table_name} "
        f"WHERE BINARY {name_column} = BINARY %s"
    )

    report_rows: list[dict[str, object]] = []
    status_counts = {
        "ok": 0,
        "needs_rename": 0,
        "needs_code": 0,
        "not_found": 0,
        "multi_match": 0,
    }
    with pymysql.connect(**connection) as conn:
        with conn.cursor() as cursor:
            for mfl_code, current_name, target_name in mapping:
                mfl_text = str(mfl_code)
                cursor.execute(source_count_query, (current_name,))
                source_count = int((cursor.fetchone() or [0])[0])
                cursor.execute(target_with_code_query, (target_name, mfl_text))
                target_with_code_count = int((cursor.fetchone() or [0])[0])
                cursor.execute(target_any_query, (target_name,))
                target_any_count = int((cursor.fetchone() or [0])[0])

                if current_name == target_name:
                    if target_any_count == 0:
                        status = "not_found"
                    elif target_with_code_count == target_any_count:
                        status = "ok"
                    else:
                        status = "needs_code"
                else:
                    if source_count > 0:
                        status = "needs_rename"
                    elif target_any_count == 0:
                        status = "not_found"
                    elif target_with_code_count < target_any_count:
                        status = "needs_code"
                    else:
                        status = "ok"

                if source_count > 1 or target_any_count > 1:
                    status_counts["multi_match"] += 1

                status_counts[status] += 1
                if status != "ok":
                    report_rows.append(
                        {
                            "mfl_code": mfl_code,
                            "current_name": current_name,
                            "target_name": target_name,
                            "source_name_rows": source_count,
                            "target_name_rows_with_code": target_with_code_count,
                            "target_name_rows_any_code": target_any_count,
                            "status": status,
                        }
                    )

    write_csv(Path(args.output), report_rows)

    print(f"Target: {args.target}")
    print(f"Table: {table_name}")
    print(f"Mappings checked: {len(mapping)}")
    print(f"OK mappings: {status_counts['ok']}")
    print(f"Needs rename: {status_counts['needs_rename']}")
    print(f"Needs code only: {status_counts['needs_code']}")
    print(f"Not found by name: {status_counts['not_found']}")
    print(f"Multi-match mappings: {status_counts['multi_match']}")
    print(f"Mappings needing attention: {len(report_rows)}")
    print(f"Output: {args.output}")


if __name__ == "__main__":
    main()
