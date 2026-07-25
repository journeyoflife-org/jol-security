#!/usr/bin/env bash
# test-no-orphan-directories.sh - T1: Flag unexpected top-level directories
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T1: No Orphan Directories"

EXPECTED_TOP_DIRS=(
  compliance
  policies
  procedures
  runbooks
  diagrams
  templates
  scripts
  ci
  tooling
  audits
  docs
  tests
  .github
)

while IFS= read -r dir; do
  dirname="$(basename "${dir}")"
  # Skip hidden system dirs and .venv
  [[ "${dirname}" == ".git" ]] && continue
  [[ "${dirname}" == ".venv" ]] && continue
  [[ "${dirname}" == ".idea" ]] && continue

  found=false
  for expected in "${EXPECTED_TOP_DIRS[@]}"; do
    if [[ "${dirname}" == "${expected}" ]]; then
      found=true
      break
    fi
  done

  if [[ "${found}" == "true" ]]; then
    assert_pass "Expected top-level directory: ${dirname}"
  else
    assert_fail "Unexpected top-level directory: ${dirname}"
  fi
done < <(find "${REPO_ROOT}" -maxdepth 1 -mindepth 1 -type d | sort)

suite_end
