#!/usr/bin/env bash
# test-secrets-scan-fail.sh - T8: Verify secrets-scan.sh fails when secret is injected
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"
source "${SCRIPT_DIR}/../helpers/setup-temp-repo.sh"

suite_start "T8: secrets-scan.sh FAIL (injected secret)"

TEMP_REPO=$(setup_temp_repo)
trap cleanup_temp_repo EXIT

# Inject a fake AWS key into a test file
echo "AWS_KEY=AKIAIOSFODNN7EXAMPLE" > "${TEMP_REPO}/policies/fake-secret-test.md"

if "${TEMP_REPO}/scripts/secrets-scan.sh" > /dev/null 2>&1; then
  assert_fail "secrets-scan.sh exits 0 when secret is present (expected non-zero)"
else
  assert_pass "secrets-scan.sh exits non-zero when secret is injected"
fi

suite_end
