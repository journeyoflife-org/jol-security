#!/usr/bin/env bash
# test-internal-links.sh - T5: Verify all backtick-enclosed file paths resolve
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T5: Internal Cross-Reference Integrity"

BROKEN=0
CHECKED=0

# Scan all .md files for backtick-enclosed relative paths
while IFS= read -r -d '' mdfile; do
  rel_file="${mdfile#${REPO_ROOT}/}"

  # Extract backtick-enclosed paths that look like file references
  while IFS= read -r ref; do
    # Skip empty, URLs, commands, and non-file references
    [[ -z "${ref}" ]] && continue
    [[ "${ref}" == http* ]] && continue
    [[ "${ref}" == /* ]] && continue
    [[ "${ref}" == *'('* ]] && continue
    [[ "${ref}" == *' '* ]] && continue
    [[ "${ref}" =~ \.(md|csv|yml|yaml|sh)$ ]] || continue

    CHECKED=$((CHECKED + 1))
    full_path="${REPO_ROOT}/${ref}"
    if [[ -f "${full_path}" ]]; then
      assert_pass "${rel_file} → ${ref}"
    else
      assert_fail "${rel_file} → ${ref} (BROKEN)"
      BROKEN=$((BROKEN + 1))
    fi
  done < <(grep -oP '`[a-zA-Z0-9_./-]+\.[a-z]+`' "${mdfile}" 2>/dev/null | tr -d '`' | sort -u || true)
done < <(find "${REPO_ROOT}" -name '*.md' \
  -not -path '*/.git/*' \
  -not -path '*/.venv/*' \
  -not -path '*/.idea/*' \
  -not -path '*/tests/*' \
  -print0 2>/dev/null)

echo ""
echo "  Cross-references checked: ${CHECKED}"
echo "  Broken: ${BROKEN}"

suite_end
