#!/usr/bin/env bash
# test-policy-lint-pass.sh - T8: Verify policy-lint.sh passes on valid policies
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T8: policy-lint.sh PASS (valid policies)"

if "${REPO_ROOT}/scripts/policy-lint.sh" > /dev/null 2>&1; then
  assert_pass "policy-lint.sh exits 0 on valid policies"
else
  assert_fail "policy-lint.sh exits non-zero on valid policies"
fi

suite_end
