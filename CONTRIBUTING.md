# Contributing to jol-security

Thank you for helping maintain `jol-security`, the security and compliance repository for the Journey of Life platform.

This repository is governed as a **compliance-controlled asset**. Contributions must be precise, reviewable, signed, and free of secrets or personal data.

## Scope of Contributions

### Accepted

- Policy updates
- Procedure and runbook improvements
- Control mapping corrections
- Documentation clarifications
- Validation script improvements that do not embed secrets
- Evidence metadata or pointer updates
- CI/CD pipeline enhancements
- Template improvements

### Not Accepted

- Production application code
- Secrets, credentials, private keys, tokens, or certificates
- Raw personal data
- Unsanitized audit exports
- Unreviewed policy exceptions
- Temporary drafts not part of approved governance

## Before You Contribute

Before opening a pull request:

1. Search existing issues and pull requests to avoid duplicates
2. Review [README.md](README.md), [SECURITY.md](SECURITY.md), and [governance.yml](governance.yml)
3. Confirm your change is within scope
4. Confirm the change does not introduce confidential material
5. Confirm the change can be explained in audit-ready language

## Required Contribution Standard

All contributions must satisfy the following:

- Changes **must** be made through a pull request
- Commits and tags **must** be GPG-signed (see `tooling/git/signing-policy.md`)
- Changes **must** be reviewed by the appropriate owners
- Validation checks **must** pass before merge
- **No secrets** may be committed
- Evidence must be referenced, not copied, unless the material is explicitly approved for inclusion

## Branching Rules

- Do **not** commit directly to the protected default branch (`main`)
- Use a short-lived topic branch for each change
- Keep branches focused on one logical purpose
- Rebase or update your branch when required by maintainers
- Never rewrite shared history

### Branch Naming

| Type          | Pattern                                |
|---------------|----------------------------------------|
| Policy update | `policy/<topic>-<brief-description>`   |
| Procedure     | `procedure/<topic>-<brief-description>`|
| Compliance    | `compliance/<control-id>-<action>`     |
| Script        | `script/<brief-description>`           |
| Documentation | `docs/<brief-description>`             |

### Workflow

```bash
# Create a topic branch
git checkout -b policy/update-access-control

# Make changes and validate
./scripts/validate-local-repo.sh
./scripts/secrets-scan.sh
./scripts/policy-lint.sh

# Sign and commit
git add .
git commit -S -m "Update access control policy for MFA requirement"

# Push and create PR
git push -u origin policy/update-access-control
gh pr create
```

## Pull Request Expectations

Every pull request should include:

- A clear **summary** of the change
- The **reason** for the change
- The affected **policy, procedure, or control reference**
- A note on whether the change affects **SOC 2, GDPR, or ISO 27001** evidence
- A **validation summary** (which checks passed)
- Any **follow-up actions** required by reviewers

A pull request is **incomplete** if the reviewer cannot quickly determine what changed and why it matters.

### PR Checklist

Use the pull request template (`.github/PULL_REQUEST_TEMPLATE.md`) which enforces:

- [ ] Document follows appropriate template structure
- [ ] All required metadata fields present
- [ ] Cross-references use relative paths
- [ ] Validation scripts pass
- [ ] Commits are GPG-signed
- [ ] Reviewers assigned per governance rules

## Validation Requirements

Before requesting review, run all local validation checks:

| Check               | Command                                  | Required |
|---------------------|------------------------------------------|----------|
| Structure validation| `./scripts/validate-local-repo.sh`       | Yes      |
| Secret scanning     | `./scripts/secrets-scan.sh`              | Yes      |
| Policy lint         | `./scripts/policy-lint.sh`               | Yes (if policies changed) |
| Evidence manifest   | `./scripts/evidence-manifest.sh`         | Yes (if compliance changed) |
| Branch protection   | `./scripts/branch-protection-check.sh`   | Recommended |

If a validation check fails, **fix the root cause** before asking for review.

## Writing Standard

Use clear, formal, and audit-friendly language.

- Prefer explicit statements over ambiguous wording
- Avoid informal shorthand
- Do not invent control mappings, evidence, or dates
- If required data is missing, mark it as `DATA_REQUIRED`
- Keep document changes minimal and traceable

### Markdown Conventions

- Use ATX-style headers (`#`, `##`, `###`)
- Use fenced code blocks with language identifiers
- One sentence per line for readability
- Reference other documents using relative links
- Follow `.editorconfig` settings

### Policy Documents

- Follow the structure in `templates/`
- Include: Policy ID, Effective Date, Owner, Classification
- Reference applicable controls in `compliance/control-matrix.csv`
- Require Security Lead sign-off before merge

### Commit Messages

- Use imperative mood: `Add control mapping for AC-3`
- Reference issue numbers where applicable
- All commits **must** be GPG-signed

## Security and Privacy Rules

This repository is subject to strict handling rules:

- **Do not** add secrets, credentials, or private keys
- **Do not** add personal data unless explicitly approved and required
- **Do not** add raw incident logs containing sensitive content
- **Do not** add copies of regulated evidence unless the storage method is approved
- **Do not** paste content from external systems without checking for confidentiality

If you discover a security issue, report it through [SECURITY.md](SECURITY.md) rather than including details in a public or open workflow.

## Review and Approval

Depending on the file changed, one or more of the following reviewers may be required:

| Change Type              | Required Reviewer(s)                |
|--------------------------|-------------------------------------|
| Security policy          | Security Owner                      |
| Compliance mapping       | Compliance Owner                    |
| Privacy-related          | Privacy/DPO Contact                 |
| CI/CD pipeline           | Repository Maintainer               |
| General documentation    | Any reviewer                        |
| Emergency change         | Security Owner + Change Control Approver |

Do not request final merge approval until **all required reviewers** have signed off.

### Review SLAs

| Severity     | Review Target  |
|--------------|----------------|
| Emergency    | 4 hours        |
| High         | 2 business days|
| Standard     | 5 business days|

## Documentation Changes

When editing policy or procedure documents:

- Update related control references in `compliance/control-matrix.csv`
- Update the review date if the document is approved
- Note whether the change affects operational behavior
- Keep history and rationale clear for future audits
- Update `compliance/evidence-catalog.md` if evidence references change

## Evidence Handling

Evidence belongs in the approved evidence system, **not** in working documents. Use repository files only for:

- Metadata
- Paths or identifiers
- Retention references
- Approval state

If a change affects evidence handling, update the evidence catalogue and control matrix **together**.

## Incident-Related Changes

If your contribution touches incident response, breach notification, or logging:

- Preserve escalation clarity
- Do **not** weaken notification or retention requirements
- Keep language aligned to the approved incident workflow (`policies/incident-response-policy.md`)
- Avoid creating ambiguous ownership

## Questions Before You Submit

If you are unsure whether your change belongs here:

1. Open an issue or contact the maintainer
2. Describe the proposed change at a high level
3. Wait for direction before preparing the full patch

## Code of Conduct

All contributors are expected to follow [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md). Report concerns to `conduct@journeyoflife.org`.

## Contribution Principle

> If a change cannot survive **security review**, **privacy review**, and **audit review**, it is not ready for this repository.
