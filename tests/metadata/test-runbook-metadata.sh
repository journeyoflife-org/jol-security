#!/usr/bin/env bash
# test-runbook-metadata.sh - T4: Verify runbooks contain required metadata
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
RUNBOOKS_DIR="${REPO_ROOT}/runbooks"

suite_start "T4: Runbook Metadata"

if [[ ! -d "${RUNBOOKS_DIR}" ]]; then
  assert_fail "Runbooks directory not found"
  suite_end
  exit 1
fi

for runbook in "${RUNBOOKS_DIR}"/*.md; do
  filename="$(basename "${runbook}")"

  assert_file_contains "${runbook}" "Runbook ID" "${filename} has Runbook ID"
  assert_file_contains "${runbook}" "Purpose" "${filename} has Purpose"
  assert_file_contains "${runbook}" "Frequency" "${filename} has Frequency"
  assert_file_contains "${runbook}" "## References" "${filename} has References section"
done

suite_end
