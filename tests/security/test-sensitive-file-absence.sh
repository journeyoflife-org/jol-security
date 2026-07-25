#!/usr/bin/env bash
# test-sensitive-file-absence.sh - T7: Verify no sensitive files in tree
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T7: Sensitive File Absence"

# Check for common sensitive file types that should never be committed
SENSITIVE_PATTERNS=(
  "*.pem"
  "*.key"
  "*.p12"
  "*.pfx"
  "*.keystore"
  "*.jks"
  "*.p7b"
  "*.p8"
)

for pattern in "${SENSITIVE_PATTERNS[@]}"; do
  found=$(find "${REPO_ROOT}" -name "${pattern}" \
    -not -path '*/.git/*' -not -path '*/.venv/*' 2>/dev/null || true)
  if [[ -z "${found}" ]]; then
    assert_pass "No ${pattern} files in repository"
  else
    assert_fail "Sensitive file found: ${found}"
  fi
done

# Verify no .env files (except .env.example)
env_files=$(find "${REPO_ROOT}" -name '.env' -o -name '.env.*' \
  -not -name '.env.example' \
  -not -path '*/.git/*' -not -path '*/.venv/*' 2>/dev/null || true)
if [[ -z "${env_files}" ]]; then
  assert_pass "No .env files in repository"
else
  assert_fail "Environment file found: ${env_files}"
fi

suite_end
