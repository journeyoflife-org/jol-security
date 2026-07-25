#!/usr/bin/env bash
# run-all-tests.sh - Master test runner for jol-security
# Executes all test suites and reports aggregate results
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/helpers/assert.sh"

TOTAL_PASS=0
TOTAL_FAIL=0
SUITES_RUN=0
SUITES_FAILED=0

echo ""
echo "═══════════════════════════════════════════════════════"
echo "  jol-security Test Suite"
echo "  $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
echo "═══════════════════════════════════════════════════════"

run_suite() {
  local script="$1"
  local name="$(basename "${script}")"
  SUITES_RUN=$((SUITES_RUN + 1))

  # Run the test script and capture its output
  local output
  local exit_code=0
  output=$("${script}" 2>&1) || exit_code=$?
  echo "${output}"

  # Extract pass/fail counts from suite_end output
  local pass_count
  local fail_count
  pass_count=$(echo "${output}" | grep -oP '\d+/\d+ passed' | grep -oP '^\d+' || echo "0")
  fail_count=$(echo "${output}" | grep -oP '\d+ failed' | grep -oP '^\d+' || echo "0")

  TOTAL_PASS=$((TOTAL_PASS + pass_count))
  TOTAL_FAIL=$((TOTAL_FAIL + fail_count))

  if [[ ${exit_code} -ne 0 ]]; then
    SUITES_FAILED=$((SUITES_FAILED + 1))
  fi
}

# --- Run all test suites in order ---
echo ""

# Structure tests (T1)
for script in "${SCRIPT_DIR}/structure"/test-*.sh; do
  [[ -x "${script}" ]] && run_suite "${script}"
done

# Metadata tests (T2-T4, T12)
for script in "${SCRIPT_DIR}/metadata"/test-*.sh; do
  [[ -x "${script}" ]] && run_suite "${script}"
done

# Cross-reference tests (T5-T6)
for script in "${SCRIPT_DIR}/crossref"/test-*.sh; do
  [[ -x "${script}" ]] && run_suite "${script}"
done

# Security tests (T7)
for script in "${SCRIPT_DIR}/security"/test-*.sh; do
  [[ -x "${script}" ]] && run_suite "${script}"
done

# Script unit tests (T8) - run pass tests only by default (fail tests use temp repos)
for script in "${SCRIPT_DIR}/scripts"/test-*-pass.sh; do
  [[ -x "${script}" ]] && run_suite "${script}"
done

# Run negative-path script tests (these create temp repos)
for script in "${SCRIPT_DIR}/scripts"/test-*-fail.sh; do
  [[ -x "${script}" ]] && run_suite "${script}"
done

# Pipeline tests (T9)
for script in "${SCRIPT_DIR}/pipeline"/test-*.sh; do
  [[ -x "${script}" ]] && run_suite "${script}"
done

# Compliance tests (T11)
for script in "${SCRIPT_DIR}/compliance"/test-*.sh; do
  [[ -x "${script}" ]] && run_suite "${script}"
done

# Governance tests (T13)
for script in "${SCRIPT_DIR}/governance"/test-*.sh; do
  [[ -x "${script}" ]] && run_suite "${script}"
done

# --- Final Summary ---
echo ""
echo "  Suites run: ${SUITES_RUN} (${SUITES_FAILED} failed)"
print_final_summary "${TOTAL_PASS}" "${TOTAL_FAIL}"
