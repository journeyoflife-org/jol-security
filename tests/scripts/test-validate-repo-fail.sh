#!/usr/bin/env bash
# test-validate-repo-fail.sh - T8: Verify validate-local-repo.sh fails on broken structure
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"
source "${SCRIPT_DIR}/../helpers/setup-temp-repo.sh"

suite_start "T8: validate-local-repo.sh FAIL (missing directory)"

TEMP_REPO=$(setup_temp_repo)
trap cleanup_temp_repo EXIT

# Remove a required directory to simulate failure
rm -rf "${TEMP_REPO}/compliance"

output=$("${TEMP_REPO}/scripts/validate-local-repo.sh" 2>&1) && exit_code=0 || exit_code=$?

if [[ ${exit_code} -ne 0 ]]; then
  assert_pass "validate-local-repo.sh exits non-zero on broken repo"
else
  assert_fail "validate-local-repo.sh exits 0 on broken repo (expected non-zero)"
fi

if echo "${output}" | grep -q "Missing directory: compliance"; then
  assert_pass "Output reports missing compliance directory"
else
  assert_fail "Output does not report missing compliance directory"
fi

suite_end
