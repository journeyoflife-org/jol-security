# Local Validation Runbook

**Runbook ID**: RB-LV-001
**Purpose**: Validate the local repository structure and integrity before committing changes
**Frequency**: Before each commit / on-demand

## Pre-Flight Checks

```bash
# 1. Navigate to repository root
cd /opt/jol/repos/jol-security

# 2. Run the validation script
./scripts/validate-local-repo.sh

# 3. Check for secrets
./scripts/secrets-scan.sh

# 4. Lint policy documents
./scripts/policy-lint.sh
```

## Validation Checklist

### Structure Validation

- [ ] All required directories exist
- [ ] All required files are present (compare against tree in README)
- [ ] No empty directories (except `audits/internal/` and `audits/external/` with `.gitkeep`)
- [ ] File naming follows kebab-case convention

### Content Validation

- [ ] All policy documents contain: Policy ID, Effective Date, Owner, Classification
- [ ] All procedures reference their related policy
- [ ] All CSV files are well-formed
- [ ] No broken internal links between documents
- [ ] No secrets, tokens, or credentials present

### Git Validation

- [ ] `.gitignore` covers sensitive file types
- [ ] No large binary files (>1MB) staged
- [ ] Commit message follows conventional format
- [ ] GPG signing key is configured

## Troubleshooting

| Issue                          | Resolution                                    |
|--------------------------------|-----------------------------------------------|
| Missing directory              | Re-run `mkdir -p` commands from README        |
| Broken link                    | Update reference to correct relative path     |
| Secret detected                | Remove, rotate credential, force-push if needed |
| Policy lint failure            | Add missing metadata fields to document       |

## Success Criteria

All checks pass without errors. Warnings should be documented and tracked for resolution.

## References

- `scripts/validate-local-repo.sh`
- `scripts/secrets-scan.sh`
- `scripts/policy-lint.sh`
- `policies/secure-development-policy.md`
