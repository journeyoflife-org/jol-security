#!/usr/bin/env bash
# test-control-matrix-format.sh - T11: Verify control matrix CSV structure
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
CONTROL_MATRIX="${REPO_ROOT}/compliance/control-matrix.csv"

suite_start "T11: Control Matrix Format"

assert_file_exists "${CONTROL_MATRIX}" "Control matrix exists"

# Verify header row
header=$(head -1 "${CONTROL_MATRIX}")
expected_header="ControlID,ControlName,Category,Framework,Status,EvidenceReference,Owner,LastReviewed"
assert_equals "${expected_header}" "${header}" "CSV header matches expected format"

# Verify each row has the correct number of fields (8)
line_num=0
while IFS= read -r line; do
  line_num=$((line_num + 1))
  [[ ${line_num} -eq 1 ]] && continue  # Skip header

  field_count=$(echo "${line}" | awk -F',' '{print NF}')
  if [[ "${field_count}" -eq 8 ]]; then
    assert_pass "Row ${line_num}: correct field count (8)"
  else
    assert_fail "Row ${line_num}: expected 8 fields, got ${field_count}"
  fi

  # Verify Status is Implemented or Planned
  status=$(echo "${line}" | cut -d',' -f5)
  if [[ "${status}" == "Implemented" || "${status}" == "Planned" ]]; then
    assert_pass "Row ${line_num}: valid status '${status}'"
  else
    assert_fail "Row ${line_num}: invalid status '${status}'"
  fi
done < "${CONTROL_MATRIX}"

suite_end
