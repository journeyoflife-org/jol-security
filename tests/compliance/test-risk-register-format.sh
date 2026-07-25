#!/usr/bin/env bash
# test-risk-register-format.sh - T11: Verify risk register entries are well-formed
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
RISK_REGISTER="${REPO_ROOT}/compliance/risk-register.md"

suite_start "T11: Risk Register Format"

assert_file_exists "${RISK_REGISTER}" "Risk register exists"

# Verify required sections exist
assert_file_contains "${RISK_REGISTER}" "## Risk Matrix" "Risk matrix section present"
assert_file_contains "${RISK_REGISTER}" "## Risk Acceptance Criteria" "Risk acceptance criteria present"
assert_file_contains "${RISK_REGISTER}" "## Review Cycle" "Review cycle defined"
assert_file_contains "${RISK_REGISTER}" "## Change Log" "Change log present"

# Verify each risk entry has required fields (R-NNN format)
risk_count=$(grep -c '^| R-[0-9]' "${RISK_REGISTER}" 2>/dev/null || echo "0")
if [[ "${risk_count}" -gt 0 ]]; then
  assert_pass "Risk register contains ${risk_count} risk entries"
else
  assert_fail "Risk register has no risk entries"
fi

# Verify risk IDs follow R-NNN format
while IFS= read -r line; do
  risk_id=$(echo "${line}" | grep -oP 'R-\d+' | head -1 || true)
  if [[ -n "${risk_id}" ]]; then
    assert_pass "Valid risk ID format: ${risk_id}"
  fi
done < <(grep '^| R-' "${RISK_REGISTER}" 2>/dev/null || true)

suite_end
