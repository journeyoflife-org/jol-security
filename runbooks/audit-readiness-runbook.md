# Audit Readiness Runbook

**Runbook ID**: RB-AR-001
**Purpose**: Prepare the organization and repository for internal or external security audits
**Frequency**: Quarterly (internal), Annually (external)

## Pre-Audit Preparation

### 30 Days Before Audit

- [ ] Confirm audit scope and objectives with auditor
- [ ] Assign audit coordinator from compliance team
- [ ] Review and update `compliance/control-matrix.csv`
- [ ] Verify all policies have current effective dates and owner sign-off
- [ ] Confirm evidence catalog is up to date (`compliance/evidence-catalog.md`)

### 14 Days Before Audit

- [ ] Run local validation: `./scripts/validate-local-repo.sh`
- [ ] Run evidence manifest check: `./scripts/evidence-manifest.sh`
- [ ] Verify all procedures reference current policies
- [ ] Collect any outstanding evidence items
- [ ] Prepare audit workspace in `audits/internal/` or `audits/external/`
- [ ] Brief all team members who may be interviewed

### 7 Days Before Audit

- [ ] Conduct dry-run walkthrough of key controls
- [ ] Verify access logs are available and cover audit period
- [ ] Confirm backup and restore test results are documented
- [ ] Prepare responses for known gaps with remediation plans
- [ ] Final review of all documentation for accuracy

## During Audit

### Day-of Preparation

1. Set up dedicated audit communication channel
2. Ensure audit workspace has read access for auditors
3. Assign point-of-contact for each control area
4. Have incident response contacts available

### Audit Support

1. Respond to auditor requests within 4 business hours
2. Provide evidence via the evidence catalog references
3. Document all auditor questions and responses
4. Escalate any unexpected findings to Security Lead immediately

## Post-Audit

### Within 5 Business Days

- [ ] Receive and review draft audit report
- [ ] Validate factual accuracy of findings
- [ ] Prepare management responses for any findings
- [ ] Create remediation plan for identified gaps

### Within 30 Days

- [ ] Finalize and distribute audit report
- [ ] Update `compliance/risk-register.md` with new findings
- [ ] Track remediation items in issue tracker
- [ ] Schedule follow-up review for open items
- [ ] Archive audit materials per `policies/data-retention-policy.md`

## Common Audit Requests

| Request                          | Primary Evidence Location                   |
|----------------------------------|---------------------------------------------|
| Access control policy            | `policies/access-control-policy.md`         |
| Access review records            | `procedures/access-review-procedure.md`     |
| Incident response capability     | `policies/incident-response-policy.md`      |
| Encryption standards             | `policies/cryptography-policy.md`           |
| Vendor management                | `policies/third-party-risk-policy.md`       |
| Change management                | `policies/secure-development-policy.md`     |
| Backup and recovery              | `procedures/backup-restore-procedure.md`    |

## References

- `runbooks/local-validation-runbook.md`
- `scripts/evidence-manifest.sh`
- `templates/audit-evidence-template.md`
- `compliance/evidence-catalog.md`
