#!/usr/bin/env bash
# assert.sh - Lightweight assertion helpers for jol-security tests
# Source this file at the top of every test script:
#   source "$(dirname "${BASH_SOURCE[0]}")/../helpers/assert.sh"

set -euo pipefail

# --- Counters (shared across sourced scripts) ---
_TEST_PASS=0
_TEST_FAIL=0
_TEST_SUITE=""

# --- Suite management ---
suite_start() {
  _TEST_SUITE="$1"
  _TEST_PASS=0
  _TEST_FAIL=0
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  SUITE: ${_TEST_SUITE}"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

suite_end() {
  local total=$(( _TEST_PASS + _TEST_FAIL ))
  echo ""
  echo "  Results: ${_TEST_PASS}/${total} passed, ${_TEST_FAIL} failed"
  if [[ ${_TEST_FAIL} -gt 0 ]]; then
    echo "  STATUS: FAIL"
    return 1
  else
    echo "  STATUS: PASS"
    return 0
  fi
}

# --- Assertions ---

# Pass: record a successful assertion
assert_pass() {
  local message="${1:-assertion passed}"
  _TEST_PASS=$(( _TEST_PASS + 1 ))
  echo "  [PASS] ${message}"
}

# Fail: record a failed assertion
assert_fail() {
  local message="${1:-assertion failed}"
  _TEST_FAIL=$(( _TEST_FAIL + 1 ))
  echo "  [FAIL] ${message}"
}

# Assert that a file exists
assert_file_exists() {
  local path="$1"
  local label="${2:-File exists: ${path}}"
  if [[ -f "${path}" ]]; then
    assert_pass "${label}"
  else
    assert_fail "${label}"
  fi
}

# Assert that a directory exists
assert_dir_exists() {
  local path="$1"
  local label="${2:-Directory exists: ${path}}"
  if [[ -d "${path}" ]]; then
    assert_pass "${label}"
  else
    assert_fail "${label}"
  fi
}

# Assert that a file does NOT exist
assert_file_not_exists() {
  local path="$1"
  local label="${2:-File does not exist: ${path}}"
  if [[ ! -f "${path}" ]]; then
    assert_pass "${label}"
  else
    assert_fail "${label}"
  fi
}

# Assert that a file contains a pattern
assert_file_contains() {
  local path="$1"
  local pattern="$2"
  local label="${3:-File ${path} contains: ${pattern}}"
  if grep -q "${pattern}" "${path}" 2>/dev/null; then
    assert_pass "${label}"
  else
    assert_fail "${label}"
  fi
}

# Assert that a file does NOT contain a pattern
assert_file_not_contains() {
  local path="$1"
  local pattern="$2"
  local label="${3:-File ${path} does not contain: ${pattern}}"
  if ! grep -q "${pattern}" "${path}" 2>/dev/null; then
    assert_pass "${label}"
  else
    assert_fail "${label}"
  fi
}

# Assert that a command exits with a specific code
assert_exit_code() {
  local expected="$1"
  shift
  local label="${1:-Command exits with code ${expected}}"
  shift || true
  local actual=0
  "$@" > /dev/null 2>&1 || actual=$?
  if [[ "${actual}" -eq "${expected}" ]]; then
    assert_pass "${label}"
  else
    assert_fail "${label} (expected ${expected}, got ${actual})"
  fi
}

# Assert that a string is non-empty
assert_not_empty() {
  local value="$1"
  local label="${2:-Value is non-empty}"
  if [[ -n "${value}" ]]; then
    assert_pass "${label}"
  else
    assert_fail "${label}"
  fi
}

# Assert equality
assert_equals() {
  local expected="$1"
  local actual="$2"
  local label="${3:-Expected '${expected}', got '${actual}'}"
  if [[ "${expected}" == "${actual}" ]]; then
    assert_pass "${label}"
  else
    assert_fail "${label}"
  fi
}

# --- Summary aggregation ---
# Call this from run-all-tests.sh to print final summary
print_final_summary() {
  local total_pass="$1"
  local total_fail="$2"
  local total=$(( total_pass + total_fail ))
  echo ""
  echo "═══════════════════════════════════════════════════════"
  echo "  FINAL RESULTS: ${total_pass}/${total} passed, ${total_fail} failed"
  if [[ ${total_fail} -gt 0 ]]; then
    echo "  OVERALL: FAIL"
    echo "═══════════════════════════════════════════════════════"
    return 1
  else
    echo "  OVERALL: PASS"
    echo "═══════════════════════════════════════════════════════"
    return 0
  fi
}
