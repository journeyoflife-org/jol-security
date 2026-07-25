# Cryptography Policy

**Policy ID**: POL-CR-001
**Effective Date**: 2026-01-01
**Review Cycle**: Annually
**Owner**: Security Lead
**Classification**: Internal

## Purpose

This policy establishes requirements for the use of cryptographic controls to protect organizational data.

## Scope

Applies to all systems, services, and processes that use cryptographic mechanisms within the organization.

## Policy Statements

### 1. Encryption Standards

- Data at rest shall be encrypted using AES-256 or equivalent
- Data in transit shall be encrypted using TLS 1.2 or higher
- Deprecated algorithms (MD5, SHA-1, DES, 3DES) shall not be used

### 2. Key Management

- Cryptographic keys shall be generated using approved random number generators
- Keys shall be stored in hardware security modules (HSMs) or approved key vaults
- Key rotation shall follow `procedures/key-rotation-procedure.md`
- Key material shall never be stored in source code or version control

### 3. Certificate Management

- TLS certificates shall be issued by approved Certificate Authorities
- Certificates shall be monitored for expiration (minimum 30-day warning)
- Wildcard certificates require Security Lead approval
- Certificate revocation shall be processed within 24 hours of compromise detection

### 4. Hashing and Integrity

- SHA-256 or stronger shall be used for integrity verification
- Passwords shall be hashed using bcrypt, scrypt, or Argon2
- HMAC shall be used for message authentication

## Key Rotation Schedule

| Key Type          | Rotation Frequency | Method           |
|-------------------|--------------------|------------------|
| TLS Certificates  | Annually           | Automated        |
| Database Keys     | Every 90 days      | Automated        |
| API Keys          | Every 180 days     | Manual           |
| Signing Keys      | Annually           | Manual           |

## References

- `procedures/key-rotation-procedure.md`
- `compliance/control-matrix.csv` (SC-1)
