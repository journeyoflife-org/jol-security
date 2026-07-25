#!/usr/bin/env bash
# test-policy-metadata.sh - T2: Verify all policies contain required metadata fields
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
POLICIES_DIR="${REPO_ROOT}/policies"

suite_start "T2: Policy Metadata"

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
  assert_fail "Policies directory not found"
  suite_end
  exit 1
fi

for policy in "${POLICIES_DIR}"/*.md; do
  filename="$(basename "${policy}")"
  for field in "${REQUIRED_FIELDS[@]}"; do
    assert_file_contains "${policy}" "${field}" "${filename} contains: ${field}"
  done
  # Verify review cycle is defined
  assert_file_contains "${policy}" "Review Cycle" "${filename} defines Review Cycle"
done

suite_end
