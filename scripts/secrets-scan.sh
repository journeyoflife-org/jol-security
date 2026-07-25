#!/usr/bin/env bash
# secrets-scan.sh - Scans repository for potential secrets and credentials
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FINDINGS=0

echo "=== Secrets Scan ==="
echo "Scanning: ${REPO_ROOT}"
echo ""

# Patterns that may indicate secrets
PATTERNS=(
  'AKIA[0-9A-Z]{16}'           # AWS Access Key
  'ghp_[a-zA-Z0-9]{36}'        # GitHub Personal Access Token
  'gho_[a-zA-Z0-9]{36}'        # GitHub OAuth Token
  'sk-[a-zA-Z0-9]{48}'         # OpenAI API Key
  'password\s*=\s*["\x27][^"\x27]+'  # Hardcoded passwords
  'api[_-]?key\s*=\s*["\x27]'  # API keys in config
  'secret\s*=\s*["\x27]'       # Secrets in config
  'BEGIN (RSA |EC |DSA )?PRIVATE KEY'  # Private keys
)

EXCLUDE_DIRS=(.git .venv .idea node_modules tests)

for pattern in "${PATTERNS[@]}"; do
  results=$(grep -r -n -l -E "${pattern}" "${REPO_ROOT}" \
    --exclude-dir=".git" --exclude-dir=".venv" --exclude-dir=".idea" --exclude-dir="node_modules" --exclude-dir="tests" 2>/dev/null || true)
  if [[ -n "${results}" ]]; then
    echo "  [ALERT] Pattern detected: ${pattern}"
    while read -r file; do
      echo "    Found in: ${file#${REPO_ROOT}/}"
      FINDINGS=$((FINDINGS + 1))
    done <<< "${results}"
    echo ""
  fi
done

# Check for sensitive file extensions
SENSITIVE_FILES=(
  "*.pem"
  "*.key"
  "*.p12"
  "*.pfx"
  "*.keystore"
)

echo "--- Sensitive File Check ---"
for ext in "${SENSITIVE_FILES[@]}"; do
  found=$(find "${REPO_ROOT}" -name "${ext}" \
    -not -path '*/.git/*' -not -path '*/.venv/*' -not -path '*/tests/*' 2>/dev/null || true)
  if [[ -n "${found}" ]]; then
    echo "  [ALERT] Sensitive file found: ${ext}"
    echo "${found}"
    FINDINGS=$((FINDINGS + 1))
  fi
done
echo ""

# --- Summary ---
echo "=== Scan Summary ==="
if [[ ${FINDINGS} -gt 0 ]]; then
  echo "  Potential secrets found: ${FINDINGS}"
  echo ""
  echo "ACTION REQUIRED: Review findings and remove any secrets before committing."
  exit 1
else
  echo "  No secrets detected."
  exit 0
fi
