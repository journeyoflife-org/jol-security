# Trust Boundary Context Diagram

## Overview

This diagram defines the trust boundaries for the jol-security system and its interactions with external systems.

## Trust Zones

```
┌─────────────────────────────────────────────────────────────────────┐
│                        PUBLIC INTERNET                              │
│                                                                     │
│  ┌──────────┐    ┌──────────────┐    ┌─────────────────────┐       │
│  │ End Users │    │ 3rd Party    │    │ Security Researchers │       │
│  │           │    │ Vendors      │    │                      │       │
│  └─────┬─────┘    └──────┬───────┘    └──────────┬──────────┘       │
│        │                 │                       │                  │
└────────┼─────────────────┼───────────────────────┼──────────────────┘
         │                 │                       │
═════════╪═════════════════╪═══════════════════════╪══════════════════
  DMZ    │    Perimeter    │                       │
         │                 │                       │
═════════╪═════════════════╪═══════════════════════╪══════════════════
         │                 │                       │
┌────────┼─────────────────┼───────────────────────┼──────────────────┐
│        ▼                 ▼                       ▼                  │
│  ┌──────────────────────────────────────────────────────────┐       │
│  │              TRUSTED INTERNAL NETWORK                     │       │
│  │                                                          │       │
│  │  ┌─────────────┐  ┌──────────────┐  ┌────────────────┐  │       │
│  │  │ Identity     │  │ Security     │  │ Compliance     │  │       │
│  │  │ Provider     │  │ Services     │  │ Repository     │  │       │
│  │  │ (IdP)        │  │ (SIEM/SOC)   │  │ (jol-security) │  │       │
│  │  └──────┬───────┘  └──────┬───────┘  └───────┬────────┘  │       │
│  │         │                  │                   │          │       │
│  │         └──────────────────┴───────────────────┘          │       │
│  │                                                          │       │
│  └──────────────────────────────────────────────────────────┘       │
│                                                                     │
│  ┌──────────────────────────────────────────────────────────┐       │
│  │              RESTRICTED ZONE                              │       │
│  │                                                          │       │
│  │  ┌─────────────┐  ┌──────────────┐  ┌────────────────┐  │       │
│  │  │ Key Vault    │  │ Audit        │  │ Production     │  │       │
│  │  │ (HSM/KMS)   │  │ Evidence     │  │ Databases      │  │       │
│  │  │              │  │ Storage      │  │                │  │       │
│  │  └──────────────┘  └──────────────┘  └────────────────┘  │       │
│  │                                                          │       │
│  └──────────────────────────────────────────────────────────┘       │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## Trust Levels

| Zone                    | Trust Level | Authentication Required |
|-------------------------|-------------|-------------------------|
| Public Internet         | Untrusted   | None                    |
| DMZ / Perimeter         | Semi-trusted| TLS + API key           |
| Trusted Internal Network| Trusted     | MFA + RBAC              |
| Restricted Zone         | Highly trusted | MFA + RBAC + Dual auth |

## Boundary Crossings

| From              | To                  | Protocol   | Controls               |
|-------------------|---------------------|------------|------------------------|
| Public            | DMZ                 | HTTPS      | WAF, rate limiting     |
| DMZ               | Internal            | mTLS       | Service mesh, RBAC     |
| Internal          | Restricted          | mTLS       | MFA, dual authorization|
| Internal          | External (3rd party)| HTTPS      | API gateway, logging   |

## References

- `policies/access-control-policy.md`
- `diagrams/data-flow-overview.md`
- `compliance/scope-and-boundary.md`
