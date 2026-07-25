# Evidence Catalog

## Overview

This catalog indexes all evidence artifacts supporting compliance controls and audit requirements.

## Evidence Index

| Evidence ID | Title                              | Control Ref | Location                                  | Type         | Collected Date | Retention |
|-------------|--------------------------------------|-------------|-------------------------------------------|--------------|----------------|-----------|
| EV-001      | Access Control Policy               | AC-1        | `policies/access-control-policy.md`       | Policy       | 2026-01-15     | 3 years   |
| EV-002      | Logging Monitoring Policy           | AU-1        | `policies/logging-monitoring-policy.md`   | Policy       | 2026-01-15     | 3 years   |
| EV-003      | Incident Response Procedure         | IR-1        | `procedures/incident-response-procedure.md` | Procedure  | 2026-01-15     | 3 years   |
| EV-004      | Key Rotation Procedure              | SC-1        | `procedures/key-rotation-procedure.md`    | Procedure    | 2026-01-15     | 3 years   |
| EV-005      | Backup Restore Procedure            | CP-1        | `procedures/backup-restore-procedure.md`  | Procedure    | 2026-01-15     | 3 years   |
| EV-006      | Security Triage Runbook             | IR-1        | `runbooks/security-triage-runbook.md`     | Runbook      | 2026-01-15     | 3 years   |
| EV-007      | Control Matrix                      | All         | `compliance/control-matrix.csv`           | Reference    | 2026-01-15     | Permanent |
| EV-008      | Risk Register                       | RA-1        | `compliance/risk-register.md`             | Assessment   | 2026-01-15     | 3 years   |
| EV-009      | Account Management Controls        | AC-2        | `audits/evidence-pointers/README.md`      | Pointer      | 2026-01-15     | 3 years   |
| EV-010      | Data Flow Enforcement              | AC-4        | `diagrams/data-flow-overview.md`          | Diagram      | 2026-01-15     | 3 years   |
| EV-011      | Configuration Management Pipeline  | CM-1        | `ci/pipeline-security.yml`                | Pipeline     | 2026-01-15     | 3 years   |
| EV-012      | Identity and Authentication Flow   | IA-1        | `diagrams/identity-access-flow.md`        | Diagram      | 2026-01-15     | 3 years   |
| EV-013      | Access Review Procedure            | AC-2        | `procedures/access-review-procedure.md`   | Procedure    | 2026-01-15     | 3 years   |
| EV-014      | Audit Readiness Runbook            | CA-1        | `runbooks/audit-readiness-runbook.md`     | Runbook      | 2026-01-15     | 3 years   |

## Evidence Collection Standards

- All evidence must be timestamped and attributable to a collector
- Evidence must be stored in tamper-evident formats
- Chain of custody must be documented for audit evidence
- See `procedures/evidence-collection-procedure.md` for full standards

## Storage Locations

| Location            | Purpose                                 | Access         |
|---------------------|-----------------------------------------|----------------|
| This repository     | Policy and procedure evidence           | Org members    |
| `audits/internal/`  | Internal audit reports                  | Audit team     |
| `audits/external/`  | External audit reports                  | Compliance Officer |

## Retention Policy

- Policy and procedure evidence: 3 years from superseding date
- Audit reports: 7 years
- Incident records: 5 years from closure
- See `policies/data-retention-policy.md` for full retention schedules
