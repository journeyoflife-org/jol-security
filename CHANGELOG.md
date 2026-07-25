# Changelog

All notable changes to `jol-security` are documented in this file.

The format follows a human-readable changelog style with reverse chronological release notes. Security-relevant updates are called out explicitly so operational teams and auditors can identify them quickly. Based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Draft updates to security policies, procedures, and compliance mappings
- New evidence pointers, validation checks, or governance artifacts pending review

### Changed
- Refinements to control wording, ownership, review cadence, or repository governance
- Documentation improvements that do not alter the underlying control intent

### Fixed
- Corrections to broken links, inaccurate references, or malformed evidence metadata
- Minor editorial or structural corrections to repository documentation

### Security
- Any security-related change not yet released should be listed here with a clear summary of the impact and the review path

## [1.0.0] - 2026-07-25

### Added
- Initial production-grade structure for the `jol-security` repository
- Compliance-focused documentation for SOC 2, GDPR, and ISO 27001 alignment
- Repository governance, evidence handling guidance, and local validation expectations
- Policy, procedure, and runbook organization for security operations
- Control mapping and audit-readiness documentation for regulated review
- 9 security policies: access control, asset management, cryptography, data retention, incident response, logging/monitoring, secure development, vulnerability management, third-party risk
- 6 operational procedures: incident response, breach notification, key rotation, access review, backup/restore, evidence collection
- 4 runbooks: local validation, emergency change, security triage, audit readiness
- 5 reusable templates: incident report, audit evidence, control test, vendor assessment, risk acceptance
- 5 validation scripts: repository structure, secrets scan, policy lint, evidence manifest, branch protection
- 3 CI/CD pipelines: validation, security checks, evidence export
- Architecture diagrams: trust boundary, data flow, identity/access flow, log/evidence flow
- GitHub workflows: enforce signing, secret scan, code quality, evidence export
- Issue templates for security and compliance reporting
- Pull request template with governance checklist

### Changed
- Established the repository as a controlled system of record for security and compliance material
- Standardized repository boundaries to exclude secrets, production data, and uncontrolled operational exports

### Fixed
- N/A for the initial release

### Security
- Introduced baseline security governance for repository access, commit discipline, and evidence handling
- Defined reporting and escalation expectations for security issues and compliance exceptions
- Enforced GPG-signed commits and pull-request-only change workflow
- Configured pre-commit hooks for secret scanning and policy linting
- Established severity classification (P1-P4) for incident triage and response SLAs

## Release Policy

- Version numbers follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html)
- Each release includes only notable changes, not raw commit history
- Security fixes are always separated into a clearly labeled `Security` section
- Breaking changes to control mappings or policy intent require a major version bump
- Additions to evidence or procedures require a minor version bump
- Editorial or documentation corrections require a patch version bump

## Maintenance Rules

- Keep `[Unreleased]` at the top and update it continuously between releases
- Date releases in `YYYY-MM-DD` format
- Record only public, non-sensitive change summaries in this file
- Move detailed operational evidence to controlled documentation or evidence storage outside the changelog
- All changelog entries must be traceable to a pull request or governance approval
- Security entries must include impact summary and reference the relevant control

## References

- [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
- [Semantic Versioning](https://semver.org/spec/v2.0.0.html)
- `compliance/control-matrix.csv`
- `governance.yml`
