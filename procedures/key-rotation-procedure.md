# Key Rotation Procedure

**Procedure ID**: PRO-KR-001
**Effective Date**: 2026-01-01
**Owner**: Security Lead
**Related Policy**: `policies/cryptography-policy.md`

## Overview

This procedure provides instructions for rotating cryptographic keys to maintain the security of encrypted data.

## Rotation Schedule

| Key Type          | Frequency    | Owner            | Method       |
|-------------------|--------------|------------------|--------------|
| TLS Certificates  | Annually     | DevOps Team      | Automated    |
| Database Keys     | 90 days      | DBA Team         | Automated    |
| API Keys          | 180 days     | Development Team | Manual       |
| Signing Keys      | Annually     | Security Lead    | Manual       |
| Encryption Keys   | 90 days      | Security Lead    | Automated    |

## Procedure

### Pre-Rotation

1. Verify rotation schedule and upcoming deadlines
2. Notify dependent teams 48 hours before scheduled rotation
3. Ensure backup of current key in secure offline storage
4. Verify that rollback procedure is documented and tested

### Rotation Execution

1. Generate new key using approved key generation tool
2. Deploy new key to staging environment
3. Validate application functionality with new key
4. Deploy new key to production during maintenance window
5. Verify all services are operational with new key
6. Revoke and securely destroy old key material after 24-hour observation period

### Post-Rotation

1. Update key inventory and documentation
2. Notify dependent teams of successful rotation
3. Log rotation event with: date, key type, performed by, verification status
4. Schedule next rotation per schedule

### Emergency Rotation

If a key is suspected compromised:
1. Generate and deploy new key immediately
2. Revoke compromised key
3. Investigate potential data exposure
4. Follow `procedures/incident-response-procedure.md` if breach is confirmed

## Rollback

If issues arise after rotation:
1. Revert to previous key from secure backup
2. Investigate root cause of failure
3. Document issue and plan corrective action

## References

- `policies/cryptography-policy.md`
- `compliance/control-matrix.csv` (SC-1)
