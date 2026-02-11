#!/usr/bin/env python3
"""Identify facility-name rows that require cleanup work.

Execution command:
- ./.venv/bin/python src/identify_facility_name_gaps.py
"""

from __future__ import annotations

import argparse
import csv
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path

from openpyxl import load_workbook

# Sheet-level contract: this script only uses this worksheet and header format.
SHEET_NAME = "facility_name_variations"
EXPECTED_HEADER = (
    "facility_name (Database)",
    "Correct MFL",
    "Correct MFL Name",
    "Coment",
)


@dataclass(frozen=True)
class FacilityRow:
    excel_row: int
    source_name: str
    mfl_code: int
    target_name: str
    comment: str


def normalize_name(value: str) -> str:
    # Text normalization avoids false mismatches from spacing inconsistencies.
    return " ".join(str(value).split()).strip()


def load_rows(workbook_path: Path) -> list[FacilityRow]:
    # Keep loading strict so upstream workbook changes are visible immediately.
    wb = load_workbook(workbook_path, data_only=True)
    if SHEET_NAME not in wb.sheetnames:
        raise ValueError(f"Sheet '{SHEET_NAME}' not found in {workbook_path}")

    ws = wb[SHEET_NAME]
    header = tuple(cell.value for cell in ws[1])
    # Fail fast if the sheet contract drifts; the rest of the logic depends on this order.
    if header[:4] != EXPECTED_HEADER:
        raise ValueError(f"Unexpected header: {header[:4]}")

    rows: list[FacilityRow] = []
    for excel_row, raw in enumerate(ws.iter_rows(min_row=2, values_only=True), start=2):
        source_name, mfl_code, target_name, comment = raw[:4]
        if source_name is None and mfl_code is None and target_name is None and comment is None:
            continue
        if source_name is None or mfl_code is None or target_name is None:
            raise ValueError(f"Missing required value at row {excel_row}")

        rows.append(
            FacilityRow(
                excel_row=excel_row,
                source_name=str(source_name),
                mfl_code=int(mfl_code),
                target_name=str(target_name),
                comment="" if comment is None else str(comment),
            )
        )
    return rows


def write_gaps_csv(path: Path, rows: list[dict[str, object]]) -> None:
    # Store a flat CSV because this file is used for manual review and sign-off.
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as file_obj:
        writer = csv.DictWriter(
            file_obj,
            fieldnames=[
                "excel_row",
                "mfl_code",
                "source_name",
                "target_name",
                "comment",
                "needs_rename",
                "mfl_has_multiple_source_names",
                "gap_reason",
            ],
        )
        writer.writeheader()
        writer.writerows(rows)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--workbook", default="data/Data Cleanup_02062026.xlsx")
    parser.add_argument("--output", default="data/facility_name_gaps.csv")
    args = parser.parse_args()

    # 1) Load source rows from workbook.
    rows = load_rows(Path(args.workbook))
    source_names_by_mfl: dict[int, set[str]] = defaultdict(set)
    target_names_by_mfl: dict[int, set[str]] = defaultdict(set)
    # 2) Build per-MFL name sets so we can detect variant names under same MFL.
    for row in rows:
        # Normalize before grouping so whitespace-only differences do not create false variants.
        source_names_by_mfl[row.mfl_code].add(normalize_name(row.source_name))
        target_names_by_mfl[row.mfl_code].add(normalize_name(row.target_name))

    mfl_with_multiple_sources = {
        mfl_code for mfl_code, names in source_names_by_mfl.items() if len(names) > 1
    }
    mfl_with_multiple_targets = {
        mfl_code for mfl_code, names in target_names_by_mfl.items() if len(names) > 1
    }

    # 3) Emit rows that need rename and/or belong to variant-name MFLs.
    gaps: list[dict[str, object]] = []
    rename_count = 0
    for row in rows:
        needs_rename = normalize_name(row.source_name) != normalize_name(row.target_name)
        has_variant = row.mfl_code in mfl_with_multiple_sources
        if needs_rename:
            rename_count += 1
        if not needs_rename and not has_variant:
            continue

        reason = []
        if needs_rename:
            reason.append("rename_required")
        if has_variant:
            reason.append("mfl_name_variant")

        gaps.append(
            {
                "excel_row": row.excel_row,
                "mfl_code": row.mfl_code,
                "source_name": row.source_name,
                "target_name": row.target_name,
                "comment": row.comment,
                "needs_rename": "yes" if needs_rename else "no",
                "mfl_has_multiple_source_names": "yes" if has_variant else "no",
                "gap_reason": "|".join(reason),
            }
        )

    # Keep output name-sorted so it can be verified against the sheet quickly.
    gaps.sort(key=lambda item: (str(item["source_name"]).casefold(), int(item["excel_row"])))
    write_gaps_csv(Path(args.output), gaps)

    print(f"Rows reviewed: {len(rows)}")
    print(f"Rows requiring rename: {rename_count}")
    print(f"MFLs with multiple source-name variants: {len(mfl_with_multiple_sources)}")
    print(f"MFLs with conflicting targets: {len(mfl_with_multiple_targets)}")
    print(f"Gap rows written: {len(gaps)}")
    print(f"Output: {args.output}")


if __name__ == "__main__":
    main()
