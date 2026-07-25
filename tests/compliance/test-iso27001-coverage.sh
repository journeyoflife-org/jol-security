#!/usr/bin/env bash
# test-iso27001-coverage.sh - T11: Verify ISO 27001 clauses mapped
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
COMPLIANCE_MAP="${REPO_ROOT}/compliance/compliance-map.md"

suite_start "T11: ISO 27001 Coverage"

assert_file_exists "${COMPLIANCE_MAP}" "Compliance map exists"

# Verify key ISO 27001 Annex A clauses are documented
REQUIRED_CLAUSES=("A.5" "A.6" "A.7" "A.8" "A.9" "A.10" "A.12" "A.16")
for clause in "${REQUIRED_CLAUSES[@]}"; do
  assert_file_contains "${COMPLIANCE_MAP}" "${clause}" "ISO 27001 ${clause} documented"
done

# Verify each clause has a status (Implemented or Planned)
for clause in "${REQUIRED_CLAUSES[@]}"; do
  line=$(grep "${clause}" "${COMPLIANCE_MAP}" 2>/dev/null || true)
  if echo "${line}" | grep -qE '(Implemented|Planned)'; then
    assert_pass "${clause} has implementation status"
  else
    assert_fail "${clause} missing implementation status"
  fi
done

suite_end
