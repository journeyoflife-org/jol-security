#!/usr/bin/env bash
# test-soc2-coverage.sh - T11: Verify SOC 2 TSC mapped to controls
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
COMPLIANCE_MAP="${REPO_ROOT}/compliance/compliance-map.md"
CONTROL_MATRIX="${REPO_ROOT}/compliance/control-matrix.csv"

suite_start "T11: SOC 2 Coverage"

assert_file_exists "${COMPLIANCE_MAP}" "Compliance map exists"
assert_file_exists "${CONTROL_MATRIX}" "Control matrix exists"

# Verify CC1 through CC9 are documented in the compliance map
for cc in CC1 CC2 CC3 CC4 CC5 CC6 CC7 CC8 CC9; do
  assert_file_contains "${COMPLIANCE_MAP}" "${cc}" "SOC 2 ${cc} documented in compliance map"
done

# Verify control matrix has entries in expected families
FAMILIES=("AC" "AU" "CA" "CM" "CP" "IA" "IR" "RA" "SC" "SI")
for family in "${FAMILIES[@]}"; do
  if grep -q "^${family}-" "${CONTROL_MATRIX}" 2>/dev/null; then
    assert_pass "Control family ${family} present in control matrix"
  else
    assert_fail "Control family ${family} missing from control matrix"
  fi
done

suite_end
