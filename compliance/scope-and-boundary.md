# Scope and Boundary

## System Boundary

The jol-security repository covers the security governance, compliance, and operational security controls for the Journey of Life organization.

## In Scope

- Security policies and procedures
- Compliance mapping and audit evidence
- Incident response plans and runbooks
- Access control configurations
- Logging and monitoring configurations
- Cryptographic key management procedures
- Third-party risk assessments

## Out of Scope

- Production application source code (managed in separate repositories)
- Infrastructure-as-code for cloud resources
- End-user device management
- Physical security controls (managed by facilities team)

## System Components

| Component              | Description                              | Owner            |
|------------------------|------------------------------------------|------------------|
| Policy Engine          | Security policy definitions              | Security Lead    |
| Compliance Tracker     | Control mapping and evidence             | Compliance Officer |
| Incident Response      | IR procedures and runbooks               | IR Team          |
| Audit Repository       | Internal and external audit artifacts    | Compliance Officer |

## Interfaces

- **Upstream**: Organizational governance and risk management
- **Downstream**: Application repositories, infrastructure configurations
- **External**: Third-party vendors, audit firms

## Data Classification

All content in this repository is classified as **Internal** unless otherwise marked. See `compliance/data-classification.md` for details.

## Boundary Review

This scope document is reviewed annually or upon significant organizational change.
