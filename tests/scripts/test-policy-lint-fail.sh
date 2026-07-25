#!/usr/bin/env bash
# test-policy-lint-fail.sh - T8: Verify policy-lint.sh fails on malformed policy
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"
source "${SCRIPT_DIR}/../helpers/setup-temp-repo.sh"

suite_start "T8: policy-lint.sh FAIL (missing metadata)"

TEMP_REPO=$(setup_temp_repo)
trap cleanup_temp_repo EXIT

# Replace a policy with one missing required fields
cat > "${TEMP_REPO}/policies/test-bad-policy.md" << 'EOF'
# Bad Policy

This policy is missing all required metadata fields.

## Some Section

Content here.
EOF

if "${TEMP_REPO}/scripts/policy-lint.sh" > /dev/null 2>&1; then
  assert_fail "policy-lint.sh exits 0 on malformed policy (expected non-zero)"
else
  assert_pass "policy-lint.sh exits non-zero on malformed policy"
fi

suite_end
