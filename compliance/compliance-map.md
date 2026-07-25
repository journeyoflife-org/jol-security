# Compliance Map

## Overview

This document maps organizational security controls to applicable frameworks and standards.

## Frameworks

### SOC 2 Type II

| Trust Service Criteria | Control Family         | Reference                        |
|------------------------|------------------------|----------------------------------|
| CC1                    | Control Environment    | `policies/access-control-policy.md` |
| CC2                    | Communication & Info   | `policies/logging-monitoring-policy.md` |
| CC3                    | Risk Assessment        | `compliance/risk-register.md`    |
| CC4                    | Monitoring Activities  | `policies/logging-monitoring-policy.md` |
| CC5                    | Control Activities     | `compliance/control-matrix.csv`  |
| CC6                    | Logical & Physical Access | `policies/access-control-policy.md` |
| CC7                    | System Operations      | `procedures/incident-response-procedure.md` |
| CC8                    | Change Management      | `policies/secure-development-policy.md` |
| CC9                    | Risk Mitigation        | `policies/third-party-risk-policy.md` |

### ISO 27001 Alignment

| Clause | Description                | Status      |
|--------|----------------------------|-------------|
| A.5    | Information Security Policies | Implemented |
| A.6    | Organization of Security  | Implemented |
| A.7    | Human Resource Security   | Implemented |
| A.8    | Asset Management          | Implemented |
| A.9    | Access Control            | Implemented |
| A.10   | Cryptography              | Implemented |
| A.12   | Operations Security       | Implemented |
| A.16   | Incident Management       | Implemented |

## Cross-Reference Matrix

See `compliance/control-matrix.csv` for the detailed mapping of individual controls to evidence artifacts.

## Review Schedule

- **Quarterly**: Control matrix review
- **Annually**: Full compliance re-assessment
- **Ad hoc**: Following significant changes or incidents
