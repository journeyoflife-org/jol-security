#!/usr/bin/env bash
# test-validate-repo-pass.sh - T8: Verify validate-local-repo.sh passes on valid repo
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T8: validate-local-repo.sh PASS (valid repo)"

output=$("${REPO_ROOT}/scripts/validate-local-repo.sh" 2>&1) && exit_code=0 || exit_code=$?

# On a valid repo this should pass
if [[ ${exit_code} -eq 0 ]]; then
  assert_pass "validate-local-repo.sh exits 0 on valid repo"
else
  assert_fail "validate-local-repo.sh exits ${exit_code} on valid repo (expected 0)"
fi

if echo "${output}" | grep -q "VALIDATION PASSED"; then
  assert_pass "Output contains VALIDATION PASSED"
else
  assert_fail "Output does not contain VALIDATION PASSED"
fi

suite_end
