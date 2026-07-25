# Incident Response Policy

**Policy ID**: POL-IR-001
**Effective Date**: 2026-01-01
**Review Cycle**: Annually
**Owner**: Security Lead
**Classification**: Internal

## Purpose

This policy establishes the framework for detecting, responding to, and recovering from security incidents.

## Scope

Applies to all security incidents affecting Journey of Life systems, data, or personnel.

## Policy Statements

### 1. Incident Classification

| Severity | Description                           | Response Time | Escalation          |
|----------|---------------------------------------|---------------|---------------------|
| P1       | Active breach, data exfiltration      | 1 hour        | CISO + Legal        |
| P2       | Confirmed compromise, limited scope   | 4 hours       | Security Lead       |
| P3       | Suspected incident, under investigation | 24 hours    | IR Team             |
| P4       | Low-severity anomaly, informational   | 72 hours      | Assigned Analyst    |

### 2. Incident Response Team

- A dedicated Incident Response Team (IRT) shall be maintained
- IRT members shall be trained annually
- Tabletop exercises shall be conducted quarterly
- Contact information shall be maintained and tested monthly

### 3. Response Process

1. **Detection**: Identify and classify the incident
2. **Containment**: Limit impact and prevent spread
3. **Eradication**: Remove threat and vulnerable components
4. **Recovery**: Restore systems to normal operations
5. **Lessons Learned**: Document findings and improve controls

### 4. Communication

- Internal stakeholders shall be notified within 4 hours of P1/P2 incidents
- External notification shall follow `procedures/breach-notification-procedure.md`
- All communications shall be coordinated through the designated spokesperson

### 5. Evidence Preservation

- All incident evidence shall be preserved per `procedures/evidence-collection-procedure.md`
- Chain of custody shall be maintained throughout the investigation
- Evidence shall be retained for a minimum of 5 years

## References

- `procedures/incident-response-procedure.md`
- `procedures/breach-notification-procedure.md`
- `runbooks/security-triage-runbook.md`
- `templates/incident-report-template.md`
