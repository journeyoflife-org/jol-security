#!/usr/bin/env bash
# test-procedure-references.sh - T3: Verify procedures reference valid policies
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
PROCEDURES_DIR="${REPO_ROOT}/procedures"
POLICIES_DIR="${REPO_ROOT}/policies"

suite_start "T3: Procedure Integrity"

if [[ ! -d "${PROCEDURES_DIR}" ]]; then
  assert_fail "Procedures directory not found"
  suite_end
  exit 1
fi

for proc in "${PROCEDURES_DIR}"/*.md; do
  filename="$(basename "${proc}")"

  # Check required metadata
  assert_file_contains "${proc}" "Procedure ID" "${filename} has Procedure ID"
  assert_file_contains "${proc}" "Effective Date" "${filename} has Effective Date"
  assert_file_contains "${proc}" "Owner" "${filename} has Owner"
  assert_file_contains "${proc}" "Related Policy" "${filename} has Related Policy"

  # Extract referenced policy path and verify it exists
  policy_ref=$(grep -oP 'policies/[a-z-]+\.md' "${proc}" | head -1 || true)
  if [[ -n "${policy_ref}" ]]; then
    assert_file_exists "${REPO_ROOT}/${policy_ref}" "${filename} references existing policy: ${policy_ref}"
  else
    assert_fail "${filename} has no parseable policy reference"
  fi
done

suite_end
