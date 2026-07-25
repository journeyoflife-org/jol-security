# Records of Processing Activities (GDPR Article 30)

## Overview

This document maintains the records of processing activities as required by GDPR Article 30. It serves as the organization's processing register and is subject to periodic review and update.

## Processing Register

| Record ID | Processing Activity         | Purpose                        | Legal Basis          | Data Categories     | Data Subjects     | Recipients             | Retention   | Safeguards                |
|-----------|-----------------------------|--------------------------------|----------------------|---------------------|-------------------|------------------------|-------------|---------------------------|
| ROPA-001  | Employee HR management      | Employment administration      | Contract, Legal      | Identity, Financial | Employees         | Payroll provider       | 7 years     | Encryption, access control|
| ROPA-002  | Customer account management | Service delivery               | Contract             | Identity, Contact   | Customers         | Cloud hosting provider | Contract + 2 years | Encryption, access control|
| ROPA-003  | Security incident handling  | Incident response and recovery | Legal obligation     | Identity, Logs      | Affected parties  | IR team, Legal counsel | 5 years     | Encryption, access control|
| ROPA-004  | Vendor risk assessment      | Third-party oversight          | Legitimate interest  | Business, Contact   | Vendor contacts   | Compliance team        | 3 years     | Access control            |
| ROPA-005  | Audit evidence collection   | Compliance verification         | Legal obligation     | Logs, Reports       | Internal staff    | External auditors      | 7 years     | Encryption, access control|

## Processing Categories

### Automated Processing

- No automated decision-making or profiling that produces legal effects is conducted
- Automated security monitoring and alerting is conducted for legitimate security purposes
- Automated backup and retention processes operate per `policies/data-retention-policy.md`

### Special Category Data

- If special category data (as defined by GDPR Article 9) is processed, it must be documented here with explicit legal basis
- Currently: no special category data processing is conducted within the scope of this repository

## International Transfers

| Transfer ID | Destination Country | Transfer Mechanism        | Safeguards                    | Assessment Date |
|-------------|---------------------|---------------------------|-------------------------------|------------------|
| TRF-001     | United States       | Standard Contractual Clauses (SCCs) | EU-approved SCCs (2021/914), encryption in transit, access restricted to named personnel | 2026-01-15 |
| TRF-002     | United Kingdom      | UK Adequacy Decision (2021) | UK GDPR adequacy, contractual data processing agreement | 2026-01-15 |

> **Note**: International transfers are limited to cloud infrastructure providers supporting the services described in the Processing Register above. No transfers to countries without an adequacy decision or SCCs are conducted. Transfer mechanisms are reviewed annually or when regulatory guidance changes.

## Data Protection Impact Assessments

Processing activities that are likely to result in high risk to data subjects require a Data Protection Impact Assessment (DPIA) per GDPR Article 35.

| Processing Activity | DPIA Required | DPIA Status   | Date Completed |
|---------------------|---------------|---------------|----------------|
| ROPA-001            | No            | N/A           | N/A            |
| ROPA-002            | No            | N/A           | N/A            |
| ROPA-003            | No            | N/A           | N/A            |
| ROPA-004            | No            | N/A           | N/A            |
| ROPA-005            | No            | N/A           | N/A            |

## Maintenance

- This register shall be reviewed quarterly or when processing activities change significantly
- New processing activities must be registered before processing begins
- Changes to existing activities require review by the Privacy/DPO contact
- Records shall be made available to supervisory authorities upon request per GDPR Article 30(4)

## Ownership

| Role                | Responsibility                           |
|---------------------|------------------------------------------|
| Privacy/DPO Contact | Maintain register, respond to DPA requests|
| Compliance Officer  | Verify completeness, coordinate reviews  |
| Security Lead       | Assess safeguard adequacy                |

## References

- `policies/data-retention-policy.md`
- `compliance/data-classification.md`
- `policies/incident-response-policy.md`
- `procedures/breach-notification-procedure.md`
