#!/usr/bin/env bash
# setup-temp-repo.sh - Creates a temporary copy of the repository for isolated testing
# Usage: source this file and call setup_temp_repo / cleanup_temp_repo

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
TEMP_REPO=""

setup_temp_repo() {
  TEMP_REPO="$(mktemp -d -t jol-security-test-XXXXXX)"
  # Copy repository excluding .git, .venv, .idea
  rsync -a \
    --exclude='.git' \
    --exclude='.venv' \
    --exclude='.idea' \
    --exclude='tests/fixtures' \
    "${REPO_ROOT}/" "${TEMP_REPO}/"
  echo "${TEMP_REPO}"
}

cleanup_temp_repo() {
  if [[ -n "${TEMP_REPO}" && -d "${TEMP_REPO}" ]]; then
    rm -rf "${TEMP_REPO}"
    TEMP_REPO=""
  fi
}
