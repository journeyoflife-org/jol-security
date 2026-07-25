## Summary

[Brief description of the changes in this PR]

## Change Type

- [ ] New policy or procedure
- [ ] Update to existing document
- [ ] Compliance mapping update
- [ ] CI/CD pipeline change
- [ ] Documentation improvement
- [ ] Template update

## Related Issues

Closes #[issue number]

## Checklist

### Content

- [ ] Document follows the appropriate template structure
- [ ] All required metadata fields are present (Policy ID, Date, Owner, Classification)
- [ ] Cross-references to other documents use relative paths
- [ ] Content has been reviewed for accuracy

### Validation

- [ ] `./scripts/validate-local-repo.sh` passes
- [ ] `./scripts/secrets-scan.sh` passes
- [ ] `./scripts/policy-lint.sh` passes (for policy changes)
- [ ] `./scripts/evidence-manifest.sh` passes (for compliance changes)

### Governance

- [ ] This change does not require Security Lead approval
  - OR: Security Lead has been notified and will review
- [ ] Commit messages follow conventional format
- [ ] Commits are GPG-signed

## Review Notes

[Any additional context for reviewers]
