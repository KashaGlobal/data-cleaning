# Facility Name + MFL Code Cleanup

## Task
Update `facilities` data using the mapping sheet:
- Source workbook: `data/Data Cleanup_02062026.xlsx`
- Sheet: `facility_name_variations`
- Mapping columns:
  - `facility_name (Database)` -> current DB name (lookup key)
  - `Correct MFL` -> target value for `government_facility_code`
  - `Correct MFL Name` -> canonical target value for `facility_name`

Scope:
- Rename facilities where source name differs from canonical name.
- Update `government_facility_code` for all mapped rows (rename and non-rename rows).

## Project Files
- `src/identify_facility_name_gaps.py`: identifies rows needing rename/merge review.
- `src/run_facility_name_update_sql.py`: generates SQL + can execute updates.
- `src/verify_facility_name_updates.py`: verifies mapping status against DB.
- `data/facility_name_update_staging.sql`: generated SQL artifact.
- `data/Facility Name Cleanup - SIT Test Cases.xlsx`: SQL-only SIT test cases for warehouse testing.

## Setup
```bash
python3 -m venv .venv
./.venv/bin/pip install -r requirements.txt
```

`.env` must contain both target configs:
- Staging keys: `PDS_STG_*`
- Production keys: `PDS_*` / `PDS_DELIVERIES_*`

## Execution Flow (Engineering)

### 1) Identify mapping gaps from workbook
```bash
./.venv/bin/python src/identify_facility_name_gaps.py
```

### 2) Generate SQL + dry-run impact (no commit)
```bash
./.venv/bin/python src/run_facility_name_update_sql.py --target staging
```

### 3) Apply update
```bash
./.venv/bin/python src/run_facility_name_update_sql.py --target staging --apply
```

### 4) Verify result
```bash
./.venv/bin/python src/verify_facility_name_updates.py --target staging
```

For production, replace `staging` with `production`.

## SQL-Only Tester Flow (No Python Needed)
For warehouse SIT, use only:
- `data/Facility Name Cleanup - SIT Test Cases.xlsx`

Tester flow:
1. Copy SQL from each test case.
2. Run in MySQL Workbench.
3. Compare output with expected result in the same sheet row.
4. Record Pass/Fail in the sheet.

## Notes
- Name matching in update/verify is exact and case-sensitive (`BINARY`) to avoid collation-based false matches.
- If unresolved rows remain due source-name drift, use `kasha_facility_code` targeted updates for final correction.
