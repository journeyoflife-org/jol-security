#!/usr/bin/env bash
# test-no-secrets-in-tracked.sh - T7: Verify no secrets in tracked files
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T7: No Secrets in Tracked Files"

# Run the repository's own secrets scan
if "${REPO_ROOT}/scripts/secrets-scan.sh" > /dev/null 2>&1; then
  assert_pass "secrets-scan.sh reports no secrets"
else
  assert_fail "secrets-scan.sh detected potential secrets"
fi

# Verify no sensitive file extensions exist
SENSITIVE_EXTS=("*.pem" "*.key" "*.p12" "*.pfx" "*.keystore")
for ext in "${SENSITIVE_EXTS[@]}"; do
  found=$(find "${REPO_ROOT}" -name "${ext}" \
    -not -path '*/.git/*' -not -path '*/.venv/*' 2>/dev/null || true)
  if [[ -z "${found}" ]]; then
    assert_pass "No ${ext} files in repository"
  else
    assert_fail "Sensitive file found: ${ext}"
  fi
done

suite_end
