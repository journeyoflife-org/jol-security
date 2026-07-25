#!/usr/bin/env bash
# test-directory-existence.sh - T1: Verify all required directories exist
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T1: Directory Existence"

REQUIRED_DIRS=(
  compliance
  policies
  procedures
  runbooks
  diagrams
  templates
  scripts
  ci
  tooling/qodana
  tooling/pre-commit
  tooling/git
  audits/internal
  audits/external
  audits/evidence-pointers
  docs
  .github/ISSUE_TEMPLATE
  .github/workflows
  tests
  tests/helpers
  tests/fixtures
)

for dir in "${REQUIRED_DIRS[@]}"; do
  assert_dir_exists "${REPO_ROOT}/${dir}" "Required directory: ${dir}"
done

suite_end
