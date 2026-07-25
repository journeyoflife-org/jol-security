#!/usr/bin/env bash
# test-workflow-yaml-syntax.sh - T9: Verify GitHub workflow YAML files parse correctly
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../helpers/assert.sh"

REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

suite_start "T9: GitHub Workflow YAML Syntax"

if ! command -v python3 &> /dev/null; then
  assert_fail "python3 not available for YAML parsing"
  suite_end
  exit 0
fi

for yml in "${REPO_ROOT}/.github/workflows"/*.yml; do
  filename="$(basename "${yml}")"
  if python3 -c "import yaml; yaml.safe_load(open('${yml}'))" 2>/dev/null; then
    assert_pass ".github/workflows/${filename} parses as valid YAML"
  else
    assert_fail ".github/workflows/${filename} has invalid YAML syntax"
  fi
done

suite_end
