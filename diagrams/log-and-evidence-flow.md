# Log and Evidence Flow

## Overview

This diagram illustrates how security logs and audit evidence flow through the system from collection to storage and analysis.

## Log Flow Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                        LOG SOURCES                                  │
│                                                                     │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────────────┐   │
│  │ Identity  │  │ Application │  │ Infrastructure│  │ Security     │   │
│  │ Provider  │  │ Servers     │  │ (Cloud/Net)   │  │ Tools        │   │
│  └─────┬─────┘  └─────┬──────┘  └─────┬─────────┘  └─────┬────────┘   │
│        │               │               │                  │           │
└────────┼───────────────┼───────────────┼──────────────────┼───────────┘
         │               │               │                  │
         │ TLS           │ TLS           │ TLS              │ TLS
         ▼               ▼               ▼                  ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    LOG AGGREGATION LAYER                             │
│                                                                     │
│  ┌────────────────────────────────────────────────────────────┐    │
│  │              Centralized Log Platform (SIEM)                │    │
│  │                                                            │    │
│  │  ┌─────────┐  ┌──────────┐  ┌───────────┐  ┌──────────┐  │    │
│  │  │ Ingest  │─▶│ Parse &  │─▶│ Correlate │─▶│ Alert    │  │    │
│  │  │         │  │ Normalize│  │ & Enrich  │  │ & Route  │  │    │
│  │  └─────────┘  └──────────┘  └───────────┘  └──────────┘  │    │
│  │                                                            │    │
│  └────────────────────────────────────────────────────────────┘    │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
         │               │               │                  │
         ▼               ▼               ▼                  ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    CONSUMPTION & STORAGE                              │
│                                                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌────────────────────────┐    │
│  │ Real-time    │  │ Compliance   │  │ Evidence               │    │
│  │ Dashboards   │  │ Reports      │  │ Archive                │    │
│  │ (SOC Team)   │  │ (Quarterly)  │  │ (Immutable, 7yr)       │    │
│  └──────────────┘  └──────────────┘  └────────────────────────┘    │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## Evidence Flow

```
Incident / Audit Trigger
        │
        ▼
┌──────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│ Evidence          │     │ Evidence          │     │ Evidence          │
│ Collection        │────▶│ Catalog &         │────▶│ Immutable         │
│ (per PRO-EC-001)  │     │ Hash Verification │     │ Storage           │
└──────────────────┘     └──────────────────┘     └──────────────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │ Audit Report      │
                         │ Generation        │
                         └──────────────────┘
```

## Log Retention by Source

| Source            | Hot Storage  | Warm Storage | Cold Storage |
|-------------------|-------------|--------------|--------------|
| Authentication    | 30 days     | 6 months     | 1 year       |
| Application       | 7 days      | 30 days      | 90 days      |
| Infrastructure    | 7 days      | 30 days      | 90 days      |
| Security (SIEM)   | 30 days     | 6 months     | 1 year       |
| Audit trail       | 90 days     | 1 year       | 3 years      |

## Alert Routing

| Alert Severity | Destination           | Response SLA   |
|----------------|-----------------------|----------------|
| P1 (Critical)  | SOC + Security Lead   | 15 minutes     |
| P2 (High)      | SOC Team              | 1 hour         |
| P3 (Medium)    | Security Queue        | 24 hours       |
| P4 (Low)       | Weekly Review Batch   | 72 hours       |

## References

- `policies/logging-monitoring-policy.md`
- `procedures/evidence-collection-procedure.md`
- `runbooks/security-triage-runbook.md`
- `diagrams/trust-boundary-context.md`
