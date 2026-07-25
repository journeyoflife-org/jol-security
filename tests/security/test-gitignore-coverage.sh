#!/usr/bin/env bash
# test-gitignore-coverage.sh - T7: Verify .gitignore covers sensitive patterns
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
GITIGNORE="${REPO_ROOT}/.gitignore"

suite_start "T7: .gitignore Coverage"

assert_file_exists "${GITIGNORE}" ".gitignore exists"

REQUIRED_PATTERNS=(
  "*.pem"
  "*.key"
  "*.p12"
  "*.pfx"
  ".env"
  ".venv"
  ".idea"
  "*.log"
)

for pattern in "${REQUIRED_PATTERNS[@]}"; do
  assert_file_contains "${GITIGNORE}" "${pattern}" ".gitignore excludes: ${pattern}"
done

suite_end
