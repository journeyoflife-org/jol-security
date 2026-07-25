#!/usr/bin/env bash
# test-policy-procedure-chain.sh - Verify Policy → Procedure → Runbook chain
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T5: Policy → Procedure → Runbook Chain"

# For each procedure, verify it references a policy that exists
for proc in "${REPO_ROOT}/procedures"/*.md; do
  proc_name="$(basename "${proc}")"
  policy_ref=$(grep -oP 'policies/[a-z-]+\.md' "${proc}" | head -1 || true)
  if [[ -n "${policy_ref}" ]]; then
    assert_file_exists "${REPO_ROOT}/${policy_ref}" "${proc_name} → ${policy_ref}"
  fi
done

# For each runbook, verify it references at least one procedure or policy
for runbook in "${REPO_ROOT}/runbooks"/*.md; do
  rb_name="$(basename "${runbook}")"
  has_ref=false
  if grep -q 'procedures/' "${runbook}" 2>/dev/null || grep -q 'policies/' "${runbook}" 2>/dev/null; then
    has_ref=true
  fi
  if [[ "${has_ref}" == "true" ]]; then
    assert_pass "${rb_name} references procedures or policies"
  else
    assert_fail "${rb_name} has no procedure or policy reference"
  fi
done

suite_end
