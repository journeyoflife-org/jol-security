# Data Flow Overview

## Overview

This diagram illustrates how data flows through the jol-security system, including storage, processing, and transmission points.

## Data Flow Diagram

```
┌──────────────┐     ┌──────────────────┐     ┌──────────────────┐
│  Policy       │     │  Compliance      │     │  Audit           │
│  Authors      │     │  Officers        │     │  Teams           │
└──────┬───────┘     └────────┬─────────┘     └────────┬─────────┘
       │                      │                        │
       │ Write policies       │ Map controls           │ Submit findings
       ▼                      ▼                        ▼
┌─────────────────────────────────────────────────────────────────┐
│                    jol-security Repository                       │
│                                                                 │
│  ┌─────────┐   ┌───────────┐   ┌────────────┐   ┌──────────┐  │
│  │ policies │──▶│ compliance │──▶│ evidence   │──▶│ audits   │  │
│  │          │   │            │   │ catalog    │   │          │  │
│  └─────────┘   └───────────┘   └────────────┘   └──────────┘  │
│       │              │                │                │        │
│       ▼              ▼                ▼                ▼        │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              CI/CD Validation Pipeline                    │   │
│  │  ┌─────────┐  ┌──────────┐  ┌───────────┐              │   │
│  │  │ Secret  │  │ Policy   │  │ Evidence  │              │   │
│  │  │ Scan    │  │ Lint     │  │ Export    │              │   │
│  │  └─────────┘  └──────────┘  └───────────┘              │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
       │                      │                        │
       │ Distribute           │ Report                 │ Archive
       ▼                      ▼                        ▼
┌──────────────┐     ┌──────────────────┐     ┌──────────────────┐
│  Development │     │  Management      │     │  Immutable       │
│  Teams       │     │  Dashboards      │     │  Storage         │
└──────────────┘     └──────────────────┘     └──────────────────┘
```

## Data Categories

| Category            | Sensitivity | Encryption | Retention   |
|---------------------|-------------|------------|-------------|
| Policies            | Internal    | At rest    | 3 years     |
| Compliance mappings | Internal    | At rest    | Permanent   |
| Evidence artifacts  | Confidential| At rest + transit | 3-7 years |
| Audit reports       | Confidential| At rest + transit | 7 years    |
| CI/CD logs          | Internal    | In transit | 90 days     |

## Data Flow Rules

1. **Write access**: Only authorized roles can modify policies and procedures
2. **Read access**: Org members can read Internal documents; Confidential requires additional authorization
3. **Transmission**: All data in transit must use TLS 1.2+
4. **Storage**: Confidential data must be encrypted at rest with AES-256

## References

- `diagrams/trust-boundary-context.md`
- `compliance/data-classification.md`
- `policies/data-retention-policy.md`
