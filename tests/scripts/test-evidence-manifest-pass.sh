#!/usr/bin/env bash
# test-evidence-manifest-pass.sh - T8: Verify evidence-manifest.sh passes on valid repo
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T8: evidence-manifest.sh PASS (valid references)"

if "${REPO_ROOT}/scripts/evidence-manifest.sh" > /dev/null 2>&1; then
  assert_pass "evidence-manifest.sh exits 0 on valid repo"
else
  assert_fail "evidence-manifest.sh exits non-zero on valid repo"
fi

suite_end
