#!/usr/bin/env bash
# validate-local-repo.sh - Validates the jol-security repository structure
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ERRORS=0
WARNINGS=0

log_ok()   { echo "  [OK]   $1"; }
log_fail() { echo "  [FAIL] $1"; ERRORS=$((ERRORS + 1)); }
log_warn() { echo "  [WARN] $1"; WARNINGS=$((WARNINGS + 1)); }

echo "=== jol-security Repository Validation ==="
echo "Repository root: ${REPO_ROOT}"
echo ""

# --- Check required directories ---
echo "--- Directory Structure ---"
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
)

for dir in "${REQUIRED_DIRS[@]}"; do
  if [[ -d "${REPO_ROOT}/${dir}" ]]; then
    log_ok "Directory exists: ${dir}"
  else
    log_fail "Missing directory: ${dir}"
  fi
done
echo ""

# --- Check required root files ---
echo "--- Root Files ---"
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
  if [[ -f "${REPO_ROOT}/${file}" ]]; then
    log_ok "File exists: ${file}"
  else
    log_fail "Missing file: ${file}"
  fi
done
echo ""

# --- Check for empty files ---
echo "--- Empty File Check ---"
while IFS= read -r -d '' file; do
  rel_path="${file#${REPO_ROOT}/}"
  if [[ ! -s "${file}" ]] && [[ "$(basename "${file}")" != ".gitkeep" ]]; then
    log_warn "Empty file: ${rel_path}"
  fi
done < <(find "${REPO_ROOT}" -not -path '*/.git/*' -not -path '*/.venv/*' -not -path '*/.idea/*' -type f -print0)
echo ""

# --- Summary ---
echo "=== Validation Summary ==="
echo "  Errors:   ${ERRORS}"
echo "  Warnings: ${WARNINGS}"

if [[ ${ERRORS} -gt 0 ]]; then
  echo ""
  echo "VALIDATION FAILED"
  exit 1
else
  echo ""
  echo "VALIDATION PASSED"
  exit 0
fi
