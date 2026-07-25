#!/usr/bin/env bash
# test-secrets-scan-pass.sh - T8: Verify secrets-scan.sh passes on clean repo
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T8: secrets-scan.sh PASS (clean repo)"

if "${REPO_ROOT}/scripts/secrets-scan.sh" > /dev/null 2>&1; then
  assert_pass "secrets-scan.sh exits 0 on clean repo"
else
  assert_fail "secrets-scan.sh exits non-zero on clean repo"
fi

suite_end
