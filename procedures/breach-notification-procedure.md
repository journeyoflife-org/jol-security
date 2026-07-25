# Breach Notification Procedure

**Procedure ID**: PRO-BN-001
**Effective Date**: 2026-01-01
**Owner**: Security Lead
**Related Policy**: `policies/incident-response-policy.md`

## Overview

This procedure defines the process for notifying affected parties and regulatory bodies following a confirmed data breach.

## Trigger Conditions

This procedure is activated when:
- A confirmed breach involving personal data (PII/PHI) is identified
- A breach affects more than 500 individuals
- Regulatory notification is required by applicable law

## Notification Timeline

| Jurisdiction | Requirement                          | Deadline        |
|--------------|--------------------------------------|-----------------|
| GDPR         | Supervisory authority notification   | 72 hours        |
| GDPR         | Data subject notification            | Without undue delay |
| US State Laws| Affected individuals                 | Varies by state |
| HIPAA        | HHS notification (>500 individuals)  | 60 days         |
| SOC 2        | Affected customers                   | Per contract    |

## Procedure

### Step 1: Breach Confirmation

1. Confirm breach through incident response process (`procedures/incident-response-procedure.md`)
2. Identify scope: what data, how many individuals, which jurisdictions
3. Engage Legal Counsel for regulatory guidance

### Step 2: Notification Preparation

1. Draft notification content including:
   - Description of the breach
   - Types of data involved
   - Steps taken to contain and remediate
   - Recommendations for affected individuals
   - Contact information for questions
2. Legal Counsel reviews all notifications
3. Prepare communication channels (email, website, hotline)

### Step 3: Regulatory Notification

1. Legal Counsel prepares regulatory filings
2. Compliance Officer submits notifications within required timelines
3. Document all submissions with confirmation receipts

### Step 4: Individual Notification

1. Send direct notifications to affected individuals
2. If contact information is insufficient, publish public notice
3. Offer credit monitoring or identity protection services where appropriate

### Step 5: Post-Notification

1. Monitor for additional reports of impact
2. Respond to inquiries from affected parties and regulators
3. Document all notification activities for audit trail
4. Update incident report with notification timeline

## References

- `procedures/incident-response-procedure.md`
- `templates/incident-report-template.md`
- `compliance/risk-register.md`
