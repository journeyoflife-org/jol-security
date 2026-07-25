#!/usr/bin/env bash
# test-control-evidence-map.sh - T6: Verify controls ↔ evidence bidirectional mapping
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
CONTROL_MATRIX="${REPO_ROOT}/compliance/control-matrix.csv"
EVIDENCE_CATALOG="${REPO_ROOT}/compliance/evidence-catalog.md"

suite_start "T6: Control-Evidence Traceability"

# Check control matrix exists
assert_file_exists "${CONTROL_MATRIX}" "Control matrix exists"
assert_file_exists "${EVIDENCE_CATALOG}" "Evidence catalog exists"

# For each implemented control in the matrix, verify evidence reference exists
while IFS=',' read -r control_id name category framework status evidence_ref owner reviewed; do
  [[ "${control_id}" == "ControlID" ]] && continue

  if [[ "${status}" == "Implemented" ]]; then
    if [[ -n "${evidence_ref}" ]]; then
      assert_file_exists "${REPO_ROOT}/${evidence_ref}" "${control_id}: evidence ref ${evidence_ref} exists"
    else
      assert_fail "${control_id}: Implemented control has no evidence reference"
    fi
  elif [[ "${status}" == "Planned" ]]; then
    assert_pass "${control_id}: Planned control (evidence not required)"
  fi
done < "${CONTROL_MATRIX}"

# Verify evidence catalog entries reference valid controls
while IFS= read -r line; do
  if [[ "${line}" =~ \|.*EV-[0-9]+.*\|.*\|.*([A-Z]{2}-[0-9]+).*\| ]]; then
    control_ref="${BASH_REMATCH[1]}"
    if grep -q "^${control_ref}," "${CONTROL_MATRIX}" 2>/dev/null || [[ "${control_ref}" == "All" ]]; then
      assert_pass "Evidence entry references valid control: ${control_ref}"
    else
      assert_fail "Evidence entry references unknown control: ${control_ref}"
    fi
  fi
done < <(grep '^| EV-' "${EVIDENCE_CATALOG}" 2>/dev/null || true)

suite_end
