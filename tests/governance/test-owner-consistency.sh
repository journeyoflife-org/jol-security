#!/usr/bin/env bash
# test-owner-consistency.sh - T13: Verify governance.yml owners match document owners
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
GOVERNANCE="${REPO_ROOT}/governance.yml"

suite_start "T13: Governance Owner Consistency"

assert_file_exists "${GOVERNANCE}" "governance.yml exists"

# Verify governance defines expected roles
assert_file_contains "${GOVERNANCE}" "security_lead" "governance.yml defines security_lead"
assert_file_contains "${GOVERNANCE}" "compliance_officer" "governance.yml defines compliance_officer"

# Verify all policy owners are one of the recognized governance roles
VALID_OWNERS=("Security Lead" "Compliance Officer")
for policy in "${REPO_ROOT}/policies"/*.md; do
  filename="$(basename "${policy}")"
  owner=$(grep -oP '(?<=\*\*Owner\*\*: ).*' "${policy}" | head -1 || true)
  valid=false
  for vo in "${VALID_OWNERS[@]}"; do
    if [[ "${owner}" == "${vo}" ]]; then
      valid=true
      break
    fi
  done
  if [[ "${valid}" == "true" ]]; then
    assert_pass "${filename} owner '${owner}' is a recognized role"
  else
    assert_fail "${filename} owner '${owner}' is not a recognized governance role"
  fi
done

suite_end
