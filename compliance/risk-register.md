# Risk Register

## Overview

This register tracks identified risks, their assessments, and mitigation strategies for the jol-security boundary.

## Risk Matrix

| Risk ID | Description                        | Likelihood | Impact | Risk Level | Mitigation                          | Owner            | Status  |
|---------|------------------------------------|------------|--------|------------|-------------------------------------|------------------|---------|
| R-001   | Unauthorized access to policies    | Low        | High   | Medium     | RBAC + branch protection            | Security Lead    | Managed |
| R-002   | Stale compliance evidence          | Medium     | High   | High       | Quarterly review cycle              | Compliance Officer | Managed |
| R-003   | Secret exposure in repository      | Low        | Critical | High     | Pre-commit hooks + CI secret scan   | Security Lead    | Managed |
| R-004   | Incomplete incident response       | Low        | Critical | Medium   | Regular tabletop exercises          | IR Team          | Managed |
| R-005   | Third-party vendor compromise      | Medium     | High   | High       | Vendor assessment + monitoring      | Compliance Officer | Managed |
| R-006   | Audit evidence loss                | Low        | High   | Medium     | Evidence catalog + backup procedure | Compliance Officer | Managed |
| R-007   | Key rotation failure               | Low        | Critical | Medium   | Automated rotation + runbook        | Security Lead    | Managed |

## Risk Acceptance Criteria

- **High risks**: Must have documented mitigation plan and executive acceptance
- **Medium risks**: Must have mitigation plan with assigned owner
- **Low risks**: Accepted with periodic review

## Review Cycle

- Monthly: Risk status check-in
- Quarterly: Full risk register review
- Annually: Comprehensive risk re-assessment

## Change Log

| Date       | Change Description           | Changed By       |
|------------|------------------------------|------------------|
| 2026-01-15 | Initial risk register created | Security Lead    |
