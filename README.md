# jol-security

`jol-security` is the central security, compliance, and evidence repository for the **Journey of Life** platform. It exists to define control ownership, policy boundaries, validation requirements, and audit-ready evidence pointers for **SOC 2**, **GDPR**, and **ISO 27001**.

## Purpose

This repository is the governed source of truth for security and compliance documentation across the Journey of Life platform. It is intended for policies, procedures, control mappings, validation helpers, and evidence metadata only.

It **must not** contain:
- Production secrets
- Private keys or credentials
- Raw personal data
- Sensitive evidence files that should remain in an immutable external store

## Scope

### In Scope

- Security policies and standards
- Compliance mappings and control ownership
- Local validation scripts and enforcement helpers
- Audit evidence metadata and references
- Incident response and breach handling procedures
- Governance rules for changes to security documentation

### Out of Scope

- Application source code
- Developer sandbox content
- Temporary drafts that are not part of approved governance
- Raw exports containing personal or regulated data
- Any unreviewed or unsigned operational change

## Compliance Posture

This repository supports three overlapping control frameworks:

### SOC 2

Focus areas include:
- Access control
- Change management
- Logging and monitoring
- Incident response
- Vendor and third-party oversight

### GDPR

Focus areas include:
- Data minimization
- Purpose limitation
- Retention and deletion discipline
- Subject rights support
- Breach assessment and notification workflows
- Privacy-by-design documentation

### ISO 27001

Focus areas include:
- ISMS governance
- Risk treatment and exception handling
- Control ownership
- Evidence retention
- Continuous review and improvement

If a control cannot be traced to an owner, procedure, and evidence path, it is **not complete**.

## Repository Structure

```
jol-security/
├── compliance/          Control matrix, scope, risk register, evidence catalogue
├── policies/            Approved security and privacy policies
├── procedures/          Operational procedures for recurring security activities
├── runbooks/            Step-by-step execution guides
├── diagrams/            Architecture and data flow diagrams
├── templates/           Reusable audit and incident templates
├── scripts/             Local validation and evidence tooling
├── ci/                  CI/CD pipeline definitions
├── tooling/             Tool configurations (Qodana, pre-commit, Git)
├── audits/              Internal and external audit artifacts
├── docs/                General documentation and glossary
└── .github/             PR templates, issue templates, workflow enforcement
```

| Directory        | Purpose                                                    |
|------------------|------------------------------------------------------------|
| `compliance/`    | Control matrix, compliance map, risk register, scope docs  |
| `policies/`      | 9 organizational security policies with metadata           |
| `procedures/`    | 6 operational procedures for security processes            |
| `runbooks/`      | 4 step-by-step operational runbooks                        |
| `diagrams/`      | Trust boundary, data flow, identity, and log flow diagrams |
| `templates/`     | 5 reusable templates for reports and assessments           |
| `scripts/`       | 5 automation and validation scripts (bash)                 |
| `ci/`            | 3 CI/CD pipeline definitions (validate, security, evidence)|
| `tooling/`       | Qodana, pre-commit, and Git signing configurations         |
| `audits/`        | Internal and external audit artifact storage               |
| `docs/`          | Architecture overview, glossary, dev standards             |
| `.github/`       | Workflows, issue templates, PR template                    |

## Quick Start

```bash
# Clone the repository
git clone https://github.com/journeyoflife-org/jol-security.git
cd jol-security

# Install pre-commit hooks
pip install pre-commit
pre-commit install

# Validate repository structure
./scripts/validate-local-repo.sh

# Run security checks
./scripts/secrets-scan.sh
./scripts/policy-lint.sh
./scripts/evidence-manifest.sh
```

## Operating Rules

- All changes **must** be made through pull requests
- All commits and tags **should** be GPG-signed (see `tooling/git/signing-policy.md`)
- Security-related changes must have documented review and approval
- Secrets must **never** be committed
- Evidence belongs in an immutable external store, not in this repository
- Policy exceptions must be documented as time-bound risk acceptances
- Any undocumented process is considered **non-compliant** until approved and written down

## Local Validation

Before a pull request is opened, the repository should be validated locally.

### Minimum Checks

| Check               | Command                                  | Purpose                          |
|---------------------|------------------------------------------|----------------------------------|
| Structure validation| `./scripts/validate-local-repo.sh`       | Verify directories and files     |
| Secret scanning     | `./scripts/secrets-scan.sh`              | Detect leaked credentials        |
| Policy lint         | `./scripts/policy-lint.sh`               | Validate policy metadata fields  |
| Evidence manifest   | `./scripts/evidence-manifest.sh`         | Verify evidence cross-references |
| Branch protection   | `./scripts/branch-protection-check.sh`   | Audit GitHub protection rules    |

Validation failures **must** be fixed before merge. Exceptions require explicit approval and documented rationale.

## Evidence Handling

Evidence should be stored outside the repository in an access-controlled, immutable location. This repository should contain only:
- Evidence references
- Metadata manifests
- Control identifiers
- Review notes
- Retention instructions

### Evidence Disciplines

- Use consistent naming conventions (`EV-YYYY-NNN`)
- Record owner and review date for each item
- Restrict access by role
- Keep immutable storage for finalized audit artifacts
- See `compliance/evidence-catalog.md` for the full index

## Incident Response

Security incidents must follow the documented incident response process (`policies/incident-response-policy.md`).

The process includes:
1. **Triage** and severity classification (P1-P4)
2. **Containment** and eradication
3. **Preservation** of logs and evidence
4. **Privacy impact assessment** when personal data may be involved
5. **Breach notification** decisioning
6. Internal and external **communication** steps
7. **Post-incident** review and corrective actions

If personal data is involved, GDPR notification timing must be treated as **urgent** and handled by the designated privacy owner.

## Ownership

| Role                  | Contact                        |
|-----------------------|--------------------------------|
| Security Owner        | security@journeyoflife.org     |
| Compliance Owner      | compliance@journeyoflife.org   |
| Privacy / DPO Contact | privacy@journeyoflife.org      |
| Repository Maintainers| See `CODEOWNERS` (when configured) |

If any ownership field is missing, the repository is **incomplete for audit purposes**.

## Change Control

Every change must include:
- A clear purpose
- A linked policy, procedure, or control reference
- The expected impact
- The required reviewers
- A validation result

Emergency changes should be rare, documented, and reviewed after implementation. Permanent changes to policy must **never** be made informally.

## Reporting Security Issues

**Do not use public issues, pull requests, or discussions to report vulnerabilities.**

Use the dedicated security reporting process defined in [SECURITY.md](SECURITY.md). GitHub recommends linking to the security policy from the README for discoverability.

Preferred reporting path:
- **GitHub Security Advisory**: Use the repository's **Security** tab → **Report a vulnerability**
- **Email**: `security@journeyoflife.org`

See [SECURITY.md](SECURITY.md) for full details on responsible disclosure, severity classification, and coordinated response timelines.

## Maintenance

This repository should be reviewed regularly to keep it audit-ready.

### Recommended Review Activities

- Revalidate policies after major platform changes
- Refresh control mappings after audits
- Retire obsolete procedures
- Confirm that evidence pointers still resolve correctly
- Review repository settings and protections periodically

### Review Schedule

| Activity                     | Frequency      |
|------------------------------|----------------|
| Policy review                | Annually       |
| Control matrix review        | Quarterly      |
| Risk register review         | Quarterly      |
| Evidence catalog validation  | Quarterly      |
| Access review                | Quarterly      |
| Full compliance assessment   | Annually       |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines, style standards, and review requirements.

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for community standards and enforcement.

See [docs/local-development-standard.md](docs/local-development-standard.md) for developer setup and workflow.

## License

See [LICENSE](LICENSE) for license details.

## Operating Principle

> If a security, privacy, or compliance decision is not documented, **it does not exist for audit purposes**. Treat this repository as a governed system of record.

---

**Classification**: Internal
**Repository**: https://github.com/journeyoflife-org/jol-security
**Organization**: https://github.com/journeyoflife-org
