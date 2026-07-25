#!/usr/bin/env bash
# test-template-fields.sh - T12: Verify templates have required structural fields
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
TEMPLATES_DIR="${REPO_ROOT}/templates"

suite_start "T12: Template Completeness"

if [[ ! -d "${TEMPLATES_DIR}" ]]; then
  assert_fail "Templates directory not found"
  suite_end
  exit 1
fi

for template in "${TEMPLATES_DIR}"/*.md; do
  filename="$(basename "${template}")"

  # All templates should have a header with ID placeholder
  assert_file_contains "${template}" "ID" "${filename} has ID field"
  # All templates should have a Date field
  assert_file_contains "${template}" "Date" "${filename} has Date field"
  # All templates should have sections (## headers)
  section_count=$(grep -c '^## ' "${template}" || true)
  if [[ "${section_count}" -ge 2 ]]; then
    assert_pass "${filename} has ${section_count} sections"
  else
    assert_fail "${filename} has fewer than 2 sections (${section_count})"
  fi
done

suite_end
