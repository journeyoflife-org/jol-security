# Local Development Standard

## Purpose

This document defines the standards for working with the jol-security repository locally.

## Prerequisites

- Git with GPG signing configured (see `tooling/git/signing-policy.md`)
- Bash shell (Linux/macOS or WSL on Windows)
- GitHub CLI (`gh`) authenticated

## Initial Setup

```bash
# Clone the repository
git clone https://github.com/journeyoflife-org/jol-security.git
cd jol-security

# Install pre-commit hooks
pip install pre-commit
pre-commit install

# Verify setup
./scripts/validate-local-repo.sh
```

## Development Workflow

### Making Changes

1. Create a feature branch:
   ```bash
   git checkout -b feature/your-change-name
   ```

2. Make your changes following the structure conventions

3. Validate locally before committing:
   ```bash
   ./scripts/validate-local-repo.sh
   ./scripts/secrets-scan.sh
   ./scripts/policy-lint.sh
   ```

4. Commit with a signed commit:
   ```bash
   git add .
   git commit -S -m "Add/Update/Remove: description"
   ```

5. Push and create a pull request:
   ```bash
   git push -u origin feature/your-change-name
   gh pr create
   ```

### File Naming Conventions

- Use **kebab-case** for all file and directory names (e.g., topic-name.md)
- Policy files: `{topic}-policy.md`
- Procedure files: `{topic}-procedure.md`
- Runbook files: `{topic}-runbook.md`
- Template files: `{topic}-template.md`

### Document Standards

- All policy documents must include: Policy ID, Effective Date, Owner, Classification
- All procedures must reference their related policy
- Use relative links for internal cross-references
- One sentence per line for readability

### Quality Checks

| Check               | Script                          | When to Run      |
|---------------------|---------------------------------|------------------|
| Structure validation| `./scripts/validate-local-repo.sh` | Before commit |
| Secret scanning     | `./scripts/secrets-scan.sh`     | Before commit    |
| Policy linting      | `./scripts/policy-lint.sh`      | Before commit    |
| Evidence manifest   | `./scripts/evidence-manifest.sh`| Before PR        |
| Branch protection   | `./scripts/branch-protection-check.sh` | Periodically |

## IDE Configuration

- Follow `.editorconfig` settings (auto-applied by most IDEs)
- Enable Markdown preview for policy editing
- Configure line endings to LF

## References

- `CONTRIBUTING.md`
- `tooling/git/signing-policy.md`
- `runbooks/local-validation-runbook.md`
