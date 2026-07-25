# Repository Boundary

## Purpose

This document defines the operational and organizational boundaries of the jol-security repository.

## What This Repository IS

- The authoritative source for security policies and procedures
- A compliance evidence repository for audit readiness
- A reference architecture for security controls
- An operational playbook for incident response and security operations

## What This Repository IS NOT

- A runtime security tool or enforcement engine
- A replacement for infrastructure-as-code repositories
- A production application codebase
- A vulnerability scanner or SIEM system

## Relationship to Other Repositories

```
jol-security (Governance & Compliance)
    │
    ├──▶ Application Repos (follow secure-development-policy)
    ├──▶ Infrastructure Repos (follow access-control-policy)
    ├──▶ Shared Libraries (follow cryptography-policy)
    └──▶ Configuration Repos (follow logging-monitoring-policy)
```

## Authority

- Policies in this repository are authoritative for the entire organization
- In case of conflict between this repository and team-specific documentation, this repository takes precedence
- All exceptions must be documented via `templates/risk-acceptance-template.md`

## Maintenance

- Security Lead owns policy content
- Compliance Officer owns compliance mappings and evidence
- All changes go through PR review per `CONTRIBUTING.md`

## References

- `compliance/scope-and-boundary.md`
- `docs/architecture-overview.md`
- `governance.yml`
