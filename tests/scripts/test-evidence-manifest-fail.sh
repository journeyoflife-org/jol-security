#!/usr/bin/env bash
# test-evidence-manifest-fail.sh - T8: Verify evidence-manifest.sh fails on broken refs
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"
source "${SCRIPT_DIR}/../helpers/setup-temp-repo.sh"

suite_start "T8: evidence-manifest.sh FAIL (broken reference)"

TEMP_REPO=$(setup_temp_repo)
trap cleanup_temp_repo EXIT

# Inject a broken evidence reference into the control matrix
# Replace a valid evidence reference with a nonexistent file
sed -i 's|policies/access-control-policy.md|policies/nonexistent-file.md|' \
  "${TEMP_REPO}/compliance/control-matrix.csv"

if "${TEMP_REPO}/scripts/evidence-manifest.sh" > /dev/null 2>&1; then
  assert_fail "evidence-manifest.sh exits 0 on broken reference (expected non-zero)"
else
  assert_pass "evidence-manifest.sh exits non-zero on broken reference"
fi

suite_end
