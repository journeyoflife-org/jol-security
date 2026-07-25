# Security Policy

## Reporting a Vulnerability

If you believe you have found a security vulnerability in `jol-security` or in any repository or control document governed by it, report it privately and do not use public issues, pull requests, or discussions.

Preferred reporting path:
- **GitHub Security Advisory**: use the repository's **Security** tab and select **Report a vulnerability** if private reporting is enabled.
- If private reporting is not available, send a confidential report to the designated security contact listed below.

## Do Not Use Public Channels

Do not report vulnerabilities through:
- Public GitHub issues
- Pull requests
- Discussions
- Social media
- Unencrypted or uncontrolled messaging channels

Public disclosure before triage can increase risk to the Journey of Life platform and its data subjects.

## What to Include

Provide as much of the following as possible so the issue can be triaged quickly and accurately:

- The type of issue
- The affected repository, document, script, or procedure
- Full path(s) of the affected file(s), if applicable
- The branch, tag, commit, or release reference
- Clear reproduction steps
- Any configuration needed to reproduce the issue
- Proof-of-concept material, if safe to share
- Impact assessment, including what an attacker could do
- Your preferred contact details
- Whether you want attribution or confidentiality

## Confidentiality

We ask reporters to keep the report confidential until the issue is investigated and a coordinated disclosure plan is agreed. This protects users, customers, and operators while remediation is in progress.

## Triage Expectations

We aim to:
1. Acknowledge receipt quickly
2. Validate the report
3. Classify severity
4. Assign an owner
5. Remediate or mitigate in a controlled change window
6. Publish a coordinated advisory when appropriate

High-risk issues involving exposure of secrets, access control failure, unauthorized data access, or breach risk will be escalated immediately per `policies/incident-response-policy.md`.

### Severity Classification

| Severity | Description                                    | Response Target |
|----------|------------------------------------------------|-----------------|
| P1       | Active breach, secret exposure, data exfiltration | 1 hour       |
| P2       | Confirmed compromise, limited scope            | 4 hours         |
| P3       | Suspected issue, under investigation           | 24 hours        |
| P4       | Low-severity anomaly, informational            | 72 hours        |

## Scope

This policy applies to:
- `jol-security` repository
- Security policies and procedures maintained by this repository
- Validation and compliance automation referenced by this repository
- Evidence metadata and control mappings governed by this repository

It does not authorize disclosure of production secrets, personal data, or protected evidence content.

### Out of Scope

- Third-party services and integrations not governed by this repository
- Social engineering attacks against organization members
- Denial-of-service attacks
- Issues requiring physical access to end-user devices

## Contact

| Role                      | Contact                          |
|---------------------------|----------------------------------|
| Primary security contact  | security@journeyoflife.org       |
| Backup security contact   | ciso@journeyoflife.org           |
| Incident Response Team    | incident@journeyoflife.org       |
| Privacy / DPO contact     | privacy@journeyoflife.org        |

## Safe Handling

If the issue appears to involve:
- A leaked secret
- An exposed credential
- A live access control bypass
- Personal data exposure
- Evidence repository compromise

Then treat it as **urgent and high severity**. Preserve logs, avoid destructive testing, and provide minimal reproducible evidence only. Follow `procedures/evidence-collection-procedure.md` for evidence preservation standards.

## Coordinated Disclosure

We follow a coordinated disclosure process:

1. **Report** privately via the channels above
2. **Confirm** receipt within 48 hours
3. **Assess** impact and scope within 5 business days
4. **Remediate** or mitigate in a controlled change window
5. **Validate** the fix through testing
6. **Close** the report or publish an advisory if needed

We will credit reporters in release notes unless anonymity is requested.

### Resolution Targets

| Severity | Resolution Target |
|----------|-------------------|
| P1       | 24 hours          |
| P2       | 7 days            |
| P3       | 30 days           |
| P4       | 90 days           |

## Compliance Integration

This repository is compliance-driven. Security issues that affect confidentiality, integrity, availability, or regulatory obligations may also trigger:
- Incident response per `policies/incident-response-policy.md`
- Breach notification per `procedures/breach-notification-procedure.md`
- Privacy review
- Audit evidence capture per `procedures/evidence-collection-procedure.md`
- Risk register update per `compliance/risk-register.md`

## Supported Versions

| Version | Supported          |
|---------|--------------------|
| 1.x     | :white_check_mark: |

## References

- `policies/incident-response-policy.md`
- `procedures/incident-response-procedure.md`
- `procedures/breach-notification-procedure.md`
- `procedures/evidence-collection-procedure.md`
- `compliance/risk-register.md`
