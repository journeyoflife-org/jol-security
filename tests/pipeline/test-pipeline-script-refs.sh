#!/usr/bin/env bash
# test-pipeline-script-refs.sh - T9: Verify CI pipelines reference existing scripts
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T9: Pipeline Script References"

# Check CI pipelines and GitHub workflows for script references
for yml in "${REPO_ROOT}/ci"/*.yml "${REPO_ROOT}/.github/workflows"/*.yml; do
  filename="$(basename "${yml}")"

  # Extract ./scripts/*.sh references
  while IFS= read -r script_ref; do
    [[ -z "${script_ref}" ]] && continue
    # Normalize path
    script_path="${REPO_ROOT}/${script_ref#./}"
    if [[ -f "${script_path}" ]]; then
      assert_pass "${filename} references existing script: ${script_ref}"
    else
      assert_fail "${filename} references missing script: ${script_ref}"
    fi
  done < <(grep -oP '\./scripts/[a-z-]+\.sh' "${yml}" 2>/dev/null | sort -u || true)
done

suite_end
