# Incident Response Procedure

**Procedure ID**: PRO-IR-001
**Effective Date**: 2026-01-01
**Owner**: Security Lead
**Related Policy**: `policies/incident-response-policy.md`

## Overview

This procedure provides step-by-step instructions for responding to security incidents.

## Pre-Requisites

- Access to incident response toolkit and communication channels
- Current contact list for IR team members
- Familiarity with `runbooks/security-triage-runbook.md`

## Procedure

### Phase 1: Detection and Classification

1. Receive alert or report of potential security event
2. Gather initial facts: what, when, who, how detected
3. Classify severity using the matrix in `policies/incident-response-policy.md`
4. Assign incident ID and create incident record using `templates/incident-report-template.md`
5. Notify IR team lead within 30 minutes for P1/P2 incidents

### Phase 2: Containment

1. Implement short-term containment to limit immediate impact
   - Isolate affected systems from network
   - Disable compromised accounts
   - Block malicious IP addresses
2. Preserve evidence per `procedures/evidence-collection-procedure.md`
3. Document all containment actions with timestamps
4. Assess if short-term containment is sufficient or if long-term measures are needed

### Phase 3: Eradication

1. Identify root cause of the incident
2. Remove malicious artifacts (malware, unauthorized accounts, backdoors)
3. Apply patches or configuration changes to address vulnerabilities
4. Verify eradication through additional scanning and monitoring

### Phase 4: Recovery

1. Restore systems from known-good backups if needed (`procedures/backup-restore-procedure.md`)
2. Re-enable services in a controlled manner
3. Implement enhanced monitoring for affected systems
4. Verify system integrity before returning to normal operations

### Phase 5: Lessons Learned

1. Conduct post-incident review within 5 business days
2. Document findings, timeline, and effectiveness of response
3. Identify improvements to policies, procedures, and controls
4. Update risk register if new risks were identified
5. Distribute lessons learned report to stakeholders

## Escalation Contacts

| Priority | Contact                | Method          |
|----------|------------------------|-----------------|
| P1       | CISO                   | Phone + Email   |
| P2       | Security Lead          | Phone + Email   |
| P3/P4    | IR Team                | Email + Slack   |

## References

- `policies/incident-response-policy.md`
- `runbooks/security-triage-runbook.md`
- `procedures/evidence-collection-procedure.md`
- `templates/incident-report-template.md`
