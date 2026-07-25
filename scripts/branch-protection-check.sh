#!/usr/bin/env bash
# branch-protection-check.sh - Verifies GitHub branch protection rules
# Exit codes: 0 = all critical protections present, 1 = critical protections missing
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_NAME="journeyoflife-org/jol-security"
ERRORS=0
WARNINGS=0

log_ok()   { echo "  [OK]   $1"; }
log_fail() { echo "  [FAIL] $1"; ERRORS=$((ERRORS + 1)); }
log_warn() { echo "  [WARN] $1"; WARNINGS=$((WARNINGS + 1)); }
log_info() { echo "  [INFO] $1"; }

echo "=== Branch Protection Check ==="
echo "Repository: ${REPO_NAME}"
echo ""

# Check if gh CLI is available
if ! command -v gh &> /dev/null; then
  log_warn "GitHub CLI (gh) not installed. Skipping remote checks."
  echo ""
  echo "Install gh: https://cli.github.com/"
  exit 0
fi

# Check authentication
if ! gh auth status &> /dev/null; then
  log_warn "Not authenticated with GitHub CLI. Skipping remote checks."
  exit 0
fi

echo "--- Branch Protection Rules for 'main' ---"

# Get branch protection rules
RULES=$(gh api "repos/${REPO_NAME}/branches/main/protection" 2>/dev/null || echo "")

if [[ -z "${RULES}" ]]; then
  log_fail "No branch protection rules configured for 'main'"
  echo ""
  echo "Required rules for compliance repositories:"
  echo "  - Require pull request reviews (minimum 1)"
  echo "  - Require status checks to pass"
  echo "  - Require signed commits"
  echo "  - Include administrators"
  echo "  - Restrict force pushes"
  echo ""
  echo "=== Check Complete ==="
  echo "  Errors:   ${ERRORS}"
  echo "  Warnings: ${WARNINGS}"
  echo ""
  echo "BRANCH PROTECTION CHECK FAILED"
  exit 1
fi

# Check specific rules
echo "  Parsing protection rules..."

if echo "${RULES}" | grep -q '"required_status_checks"'; then
  log_ok "Required status checks configured"
else
  log_fail "No required status checks configured"
fi

if echo "${RULES}" | grep -q '"required_pull_request_reviews"'; then
  log_ok "Pull request reviews required"
else
  log_fail "Pull request reviews not required"
fi

if echo "${RULES}" | grep -q '"enforce_admins".*true'; then
  log_ok "Rules enforced for administrators"
else
  log_fail "Rules not enforced for administrators"
fi

if echo "${RULES}" | grep -q '"required_signatures"'; then
  log_ok "Commit signatures required"
else
  log_warn "Commit signatures not required at branch level"
fi

echo ""

# Check local signing config
echo "--- Local Git Signing Configuration ---"
SIGNING_KEY=$(git config --get user.signingkey 2>/dev/null || echo "")
if [[ -n "${SIGNING_KEY}" ]]; then
  log_ok "GPG signing key configured: ${SIGNING_KEY}"
else
  log_warn "No GPG signing key configured locally"
  echo "  Set with: git config user.signingkey <KEY_ID>"
fi

COMMIT_SIGNED=$(git config --get commit.gpgsign 2>/dev/null || echo "false")
if [[ "${COMMIT_SIGNED}" == "true" ]]; then
  log_ok "Commit signing enabled"
else
  log_warn "Commit signing not enabled"
  echo "  Enable with: git config commit.gpgsign true"
fi

echo ""

# --- Summary ---
echo "=== Check Complete ==="
echo "  Errors:   ${ERRORS}"
echo "  Warnings: ${WARNINGS}"
echo ""

if [[ ${ERRORS} -gt 0 ]]; then
  echo "BRANCH PROTECTION CHECK FAILED"
  exit 1
else
  echo "BRANCH PROTECTION CHECK PASSED"
  exit 0
fi
