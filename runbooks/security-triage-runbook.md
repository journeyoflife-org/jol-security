# Security Triage Runbook

**Runbook ID**: RB-ST-001
**Purpose**: Triage incoming security alerts and events for classification and prioritization
**Frequency**: Continuous (as alerts arrive)

## Alert Sources

- SIEM (Security Information and Event Management)
- IDS/IPS (Intrusion Detection/Prevention Systems)
- Vulnerability scanners
- User reports
- Third-party notifications

## Triage Procedure

### Step 1: Initial Assessment (0-5 minutes)

1. Review alert details: source, destination, timestamp, alert type
2. Check for duplicate or correlated alerts
3. Determine alert confidence level:
   - **High**: Confirmed malicious activity
   - **Medium**: Suspicious activity requiring investigation
   - **Low**: Informational or likely false positive

### Step 2: Classification

| Classification     | Criteria                                      | Action                    |
|--------------------|-----------------------------------------------|---------------------------|
| True Positive      | Confirmed malicious activity                  | Escalate to IR procedure  |
| False Positive     | Alert triggered on benign activity            | Tune and close            |
| Benign Anomaly     | Unusual but legitimate behavior               | Document and close        |
| Undetermined       | Insufficient information to classify          | Investigate further       |

### Step 3: Prioritization

Apply severity from `policies/incident-response-policy.md`:
- **P1**: Active breach, data exfiltration → Immediate escalation
- **P2**: Confirmed compromise → Escalate within 1 hour
- **P3**: Suspicious activity → Investigate within 4 hours
- **P4**: Low severity → Queue for next business day review

### Step 4: Escalation

1. Create incident record using `templates/incident-report-template.md`
2. Assign to appropriate responder based on classification
3. Notify relevant stakeholders per escalation matrix
4. For P1/P2: activate IR team and begin `procedures/incident-response-procedure.md`

### Step 5: Documentation

1. Record triage decision with rationale
2. Update alert status in tracking system
3. Link related alerts to incident record
4. Note any tuning recommendations for false positives

## Quick Reference

| Alert Type              | Default Severity | First Action              |
|-------------------------|-----------------|---------------------------|
| Failed logins (>10/min) | P3              | Check for brute force     |
| Privilege escalation    | P2              | Verify if authorized      |
| Data exfiltration       | P1              | Isolate affected system   |
| Malware detection       | P1/P2           | Quarantine and scan       |
| Configuration change    | P3              | Verify change authorization |

## References

- `policies/incident-response-policy.md`
- `policies/logging-monitoring-policy.md`
- `procedures/incident-response-procedure.md`
- `templates/incident-report-template.md`
