#!/usr/bin/env bash
# evidence-manifest.sh - Verifies evidence catalog references are valid
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CATALOG="${REPO_ROOT}/compliance/evidence-catalog.md"
CONTROL_MATRIX="${REPO_ROOT}/compliance/control-matrix.csv"
ERRORS=0

echo "=== Evidence Manifest Check ==="
echo ""

# --- Check catalog exists ---
if [[ ! -f "${CATALOG}" ]]; then
  echo "  [FAIL] Evidence catalog not found: ${CATALOG}"
  exit 1
fi
echo "  [OK] Evidence catalog found"

# --- Check control matrix exists ---
if [[ ! -f "${CONTROL_MATRIX}" ]]; then
  echo "  [FAIL] Control matrix not found: ${CONTROL_MATRIX}"
  exit 1
fi
echo "  [OK] Control matrix found"
echo ""

# --- Extract evidence references from catalog and verify files exist ---
echo "--- Evidence Reference Verification ---"

# Extract file paths from evidence catalog (markdown links)
while IFS= read -r line; do
  # Look for backtick-enclosed file paths
  if [[ "${line}" =~ \`([a-zA-Z0-9_./-]+\.(md|csv|yml|yaml))\` ]]; then
    ref_path="${BASH_REMATCH[1]}"
    full_path="${REPO_ROOT}/${ref_path}"
    if [[ -f "${full_path}" ]]; then
      echo "  [OK]   Referenced file exists: ${ref_path}"
    else
      echo "  [FAIL] Referenced file missing: ${ref_path}"
      ERRORS=$((ERRORS + 1))
    fi
  fi
done < "${CATALOG}"
echo ""

# --- Verify control matrix references ---
echo "--- Control Matrix Reference Verification ---"
while IFS=',' read -r control_id name category framework status evidence_ref owner reviewed; do
  # Skip header
  [[ "${control_id}" == "ControlID" ]] && continue

  if [[ -n "${evidence_ref}" ]]; then
    full_path="${REPO_ROOT}/${evidence_ref}"
    if [[ -f "${full_path}" ]]; then
      echo "  [OK]   ${control_id}: Evidence ref exists: ${evidence_ref}"
    else
      echo "  [FAIL] ${control_id}: Evidence ref missing: ${evidence_ref}"
      ERRORS=$((ERRORS + 1))
    fi
  else
    echo "  [WARN] ${control_id}: No evidence reference"
  fi
done < "${CONTROL_MATRIX}"
echo ""

# --- Summary ---
echo "=== Manifest Summary ==="
if [[ ${ERRORS} -gt 0 ]]; then
  echo "  Broken references: ${ERRORS}"
  echo ""
  echo "MANIFEST CHECK FAILED"
  exit 1
else
  echo "  All evidence references valid."
  exit 0
fi
