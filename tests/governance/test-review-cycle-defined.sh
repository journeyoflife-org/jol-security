#!/usr/bin/env bash
# test-review-cycle-defined.sh - T13: Verify all policies define review cycles
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T13: Review Cycle Defined"

for policy in "${REPO_ROOT}/policies"/*.md; do
  filename="$(basename "${policy}")"
  assert_file_contains "${policy}" "Review Cycle" "${filename} defines Review Cycle"
done

suite_end
