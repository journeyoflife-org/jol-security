# Access Review Procedure

**Procedure ID**: PRO-AR-001
**Effective Date**: 2026-01-01
**Owner**: Security Lead
**Related Policy**: `policies/access-control-policy.md`

## Overview

This procedure defines the process for conducting periodic access reviews to ensure appropriate access levels.

## Review Schedule

| Account Type       | Frequency   | Reviewer         |
|--------------------|-------------|------------------|
| Privileged accounts| Quarterly   | Security Lead    |
| Service accounts   | Semi-annually | System Owner   |
| Standard user accounts | Annually  | Department Manager |
| Third-party accounts | Quarterly | Compliance Officer |

## Procedure

### Step 1: Preparation

1. Generate access report from identity management system
2. Include: user ID, name, role, access level, last login date, account status
3. Flag accounts with: no login in 90+ days, elevated privileges, or pending termination

### Step 2: Review

1. Manager/reviewer compares current access against job requirements
2. Apply principle of least privilege: does the user need this level of access?
3. Identify:
   - Accounts to disable (no longer needed)
   - Access to reduce (excessive privileges)
   - Dormant accounts to disable

### Step 3: Remediation

1. Submit access change requests for all identified discrepancies
2. Changes shall be implemented within 5 business days
3. Verify changes were applied correctly

### Step 4: Documentation

1. Record review results in `templates/control-test-template.md`
2. Document: reviewer, date, accounts reviewed, changes made
3. Retain records for 3 years per `policies/data-retention-policy.md`
4. Report completion to Compliance Officer

## Exception Handling

- Access that cannot be immediately reduced must have documented justification
- Exceptions require Security Lead approval and quarterly re-review

## References

- `policies/access-control-policy.md`
- `templates/control-test-template.md`
- `compliance/control-matrix.csv` (AC-2, AC-5)
