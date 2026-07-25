#!/usr/bin/env bash
# test-root-files.sh - T1: Verify all required root files exist
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T1: Root Files"

ROOT_FILES=(
  README.md
  SECURITY.md
  LICENSE
  CODE_OF_CONDUCT.md
  CONTRIBUTING.md
  CHANGELOG.md
  .gitignore
  .editorconfig
  .gitattributes
  governance.yml
)

for file in "${ROOT_FILES[@]}"; do
  assert_file_exists "${REPO_ROOT}/${file}" "Required root file: ${file}"
done

suite_end
