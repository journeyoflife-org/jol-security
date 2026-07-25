# Git Commit Signing Policy

**Effective Date**: 2026-01-01
**Owner**: Security Lead

## Overview

This policy defines the requirements for Git commit signing in the jol-security repository to ensure authenticity and integrity of changes.

## Requirements

### Mandatory Signing

- All commits to `main` branch must be GPG-signed
- All merge commits must be signed
- Tag creation must use signed tags (`git tag -s`)

### Key Requirements

- Use GPG keys with minimum RSA 4096-bit or Ed25519
- Keys must be associated with your verified GitHub email
- Keys must not be shared between individuals
- Expired keys must be rotated within 7 days

## Setup Instructions

### Generate a GPG Key

```bash
gpg --full-generate-key
# Select: RSA and RSA, 4096 bits
# Set expiration: 2 years
```

### Configure Git

```bash
# Set signing key
git config --global user.signingkey <YOUR_KEY_ID>

# Enable automatic signing
git config --global commit.gpgsign true

# Export public key for GitHub
gpg --armor --export <YOUR_KEY_ID>
```

### Add to GitHub

1. Go to GitHub Settings → SSH and GPG keys
2. Add your GPG public key
3. Verify your email address

## Verification

Run the branch protection check to verify signing configuration:

```bash
./scripts/branch-protection-check.sh
```

## Exceptions

- Automated bot commits (e.g., Dependabot) are exempt from signing requirements
- Emergency situations may allow unsigned commits with post-hoc verification

## References

- `policies/secure-development-policy.md`
- `CONTRIBUTING.md`
