#!/usr/bin/env bash
# policy-lint.sh - Validates policy documents have required metadata fields
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
POLICIES_DIR="${REPO_ROOT}/policies"
ERRORS=0

echo "=== Policy Lint ==="
echo "Checking: ${POLICIES_DIR}"
echo ""

REQUIRED_FIELDS=(
  "Policy ID"
  "Effective Date"
  "Owner"
  "Classification"
  "## Purpose"
  "## Scope"
  "## References"
)

if [[ ! -d "${POLICIES_DIR}" ]]; then
  echo "  [FAIL] Policies directory not found"
  exit 1
fi

for policy in "${POLICIES_DIR}"/*.md; do
  filename="$(basename "${policy}")"
  echo "--- ${filename} ---"
  file_errors=0

  for field in "${REQUIRED_FIELDS[@]}"; do
    if grep -q "${field}" "${policy}"; then
      echo "  [OK]   Contains: ${field}"
    else
      echo "  [FAIL] Missing: ${field}"
      file_errors=$((file_errors + 1))
      ERRORS=$((ERRORS + 1))
    fi
  done

  if [[ ${file_errors} -eq 0 ]]; then
    echo "  Result: PASS"
  else
    echo "  Result: FAIL (${file_errors} issues)"
  fi
  echo ""
done

# --- Check procedures reference policies ---
echo "--- Procedure Policy References ---"
PROCEDURES_DIR="${REPO_ROOT}/procedures"
if [[ -d "${PROCEDURES_DIR}" ]]; then
  for proc in "${PROCEDURES_DIR}"/*.md; do
    filename="$(basename "${proc}")"
    if grep -q "Related Policy" "${proc}"; then
      echo "  [OK]   ${filename} references related policy"
    else
      echo "  [WARN] ${filename} missing 'Related Policy' reference"
    fi
  done
fi
echo ""

# --- Summary ---
echo "=== Lint Summary ==="
if [[ ${ERRORS} -gt 0 ]]; then
  echo "  Errors: ${ERRORS}"
  echo ""
  echo "LINT FAILED"
  exit 1
else
  echo "  All policies pass lint checks."
  exit 0
fi
