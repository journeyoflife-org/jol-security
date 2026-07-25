# Access Control Policy

**Policy ID**: POL-AC-001
**Effective Date**: 2026-01-01
**Review Cycle**: Annually
**Owner**: Security Lead
**Classification**: Internal

## Purpose

This policy establishes access control requirements for all systems and data within the Journey of Life organization.

## Scope

Applies to all employees, contractors, and third parties accessing organizational systems and data.

## Policy Statements

### 1. Principle of Least Privilege

- Access shall be granted on a need-to-know basis
- Users shall receive the minimum level of access required for their role
- Access rights shall be reviewed quarterly

### 2. Account Management

- All accounts must be uniquely identifiable
- Shared accounts are prohibited unless approved by the Security Lead
- Accounts shall be disabled within 24 hours of termination
- Dormant accounts (>90 days inactive) shall be disabled

### 3. Authentication Requirements

- Multi-factor authentication (MFA) is required for all privileged access
- Passwords must meet complexity requirements (minimum 12 characters)
- Password rotation is required every 90 days for non-MFA accounts
- Failed login attempts shall lock accounts after 5 consecutive failures

### 4. Access Reviews

- Quarterly access reviews for all privileged accounts
- Annual access reviews for all user accounts
- Review results shall be documented and retained for 3 years

### 5. Separation of Duties

- No single individual shall have end-to-end control over critical processes
- Development and production access shall be separated
- Security audit functions shall be independent of operational functions

## Enforcement

Violations of this policy may result in access revocation and disciplinary action.

## References

- `compliance/control-matrix.csv` (AC-1 through AC-5)
- `diagrams/identity-access-flow.md`
- `procedures/access-review-procedure.md`
