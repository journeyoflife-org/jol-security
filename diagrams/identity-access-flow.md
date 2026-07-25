# Identity and Access Flow

## Overview

This diagram illustrates the identity and access management flow for users and services interacting with the jol-security repository and associated systems.

## Authentication Flow

```
┌──────────┐                                    ┌──────────────────┐
│  User /   │                                    │  Identity        │
│  Service  │                                    │  Provider (IdP)  │
└─────┬─────┘                                    └────────┬─────────┘
      │                                                    │
      │  1. Authentication Request (SAML/OIDC)             │
      │ ──────────────────────────────────────────────────▶│
      │                                                    │
      │  2. MFA Challenge                                  │
      │ ◀──────────────────────────────────────────────────│
      │                                                    │
      │  3. MFA Response                                   │
      │ ──────────────────────────────────────────────────▶│
      │                                                    │
      │  4. Token (JWT with RBAC claims)                   │
      │ ◀──────────────────────────────────────────────────│
      │                                                    │
      ▼                                                    ▼
┌──────────┐                                    ┌──────────────────┐
│  GitHub   │                                    │  Authorization   │
│  Access   │ ◀── 5. Token validation ──────────│  Service         │
│  Control  │                                    │                  │
└─────┬─────┘                                    └──────────────────┘
      │
      │  6. Authorized Access
      ▼
┌─────────────────────────────────────────────────────────────────┐
│                    jol-security Repository                       │
│                                                                 │
│  ┌─────────────┐  ┌──────────────┐  ┌────────────────────────┐ │
│  │ Read        │  │ Write        │  │ Admin                  │ │
│  │ (All org)   │  │ (Authors)    │  │ (Security Lead)        │ │
│  └─────────────┘  └──────────────┘  └────────────────────────┘ │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Role-Based Access Matrix

| Role                | Read Policies | Write Policies | Admin | Audit Evidence |
|---------------------|:-------------:|:--------------:|:-----:|:--------------:|
| Org Member          | ✓             |                |       |                |
| Policy Author       | ✓             | ✓              |       |                |
| Compliance Officer  | ✓             | ✓              |       | ✓              |
| Security Lead       | ✓             | ✓              | ✓     | ✓              |
| Auditor (external)  | ✓ (read-only) |               |       | ✓ (read-only)  |

## Access Lifecycle

1. **Onboarding**: User added to org → default read access assigned
2. **Role assignment**: Manager requests elevated access → Security Lead approves
3. **Periodic review**: Quarterly access review per `procedures/access-review-procedure.md`
4. **Offboarding**: HR notification → access revoked within 24 hours

## Service Account Flow

```
Service ──▶ API Key ──▶ API Gateway ──▶ Rate Limit ──▶ Auth Check ──▶ Access
```

- Service accounts use API keys (not SSO)
- Keys rotated per `policies/cryptography-policy.md`
- All API access logged per `policies/logging-monitoring-policy.md`

## References

- `policies/access-control-policy.md`
- `procedures/access-review-procedure.md`
- `diagrams/trust-boundary-context.md`
