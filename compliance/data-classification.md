# Data Classification

## Classification Levels

| Level        | Description                                      | Handling Requirements                     |
|--------------|--------------------------------------------------|-------------------------------------------|
| **Public**   | Information approved for public release          | No restrictions                           |
| **Internal** | Information for internal use only                | Access restricted to org members          |
| **Confidential** | Sensitive information requiring protection   | Encrypted at rest and in transit          |
| **Restricted**   | Highly sensitive, need-to-know access only  | Encrypted, access logged, dual approval   |

## Repository Classification

This repository is classified as **Internal** by default.

## Document-Level Classification

| Document / Directory                | Classification  | Justification                         |
|-------------------------------------|-----------------|---------------------------------------|
| `README.md`                         | Public          | General project information           |
| `policies/`                         | Internal        | Internal security policies            |
| `procedures/`                       | Internal        | Operational procedures                |
| `compliance/risk-register.md`       | Confidential    | Risk posture information              |
| `audits/`                           | Confidential    | Audit findings and evidence           |
| `compliance/evidence-catalog.md`    | Confidential    | Evidence locations                    |
| `.github/workflows/`                | Internal        | CI/CD configurations                  |

## Handling Requirements

### Internal
- Store in organization-controlled repositories
- Do not share externally without approval

### Confidential
- Encrypt at rest (AES-256 minimum)
- Restrict access to authorized personnel
- Log all access events
- Do not include in public communications

### Restricted
- All Confidential requirements plus:
- Dual-authorization for access
- Quarterly access review
- Automatic access revocation after 90 days of inactivity

## Marking

Documents should include a classification header:

```
Classification: [Level]
```

## Review

Data classifications are reviewed annually or when the sensitivity of the information changes.
