# Backup and Restore Procedure

**Procedure ID**: PRO-BR-001
**Effective Date**: 2026-01-01
**Owner**: Security Lead
**Related Policy**: `policies/data-retention-policy.md`

## Overview

This procedure defines the requirements and steps for backing up and restoring critical data and systems.

## Backup Schedule

| Data Type            | Frequency  | Retention  | Storage Location    |
|----------------------|------------|------------|---------------------|
| Repository data      | Daily      | 30 days    | Encrypted cloud storage |
| Database snapshots   | Daily      | 90 days    | Encrypted cloud storage |
| Configuration files  | On change  | 1 year     | Version control     |
| Audit evidence       | Weekly     | 7 years    | Immutable storage   |
| System images        | Monthly    | 12 months  | Encrypted cloud storage |

## Backup Procedure

### Routine Backup

1. Verify backup job is scheduled and running per defined frequency
2. Monitor backup completion status daily
3. Verify backup integrity through checksum validation
4. Log backup results: date, size, status, verified by

### Ad-hoc Backup

1. Identify data/system requiring backup
2. Execute backup using approved tooling
3. Encrypt backup using AES-256
4. Store in designated backup location
5. Document backup event and retention period

## Restore Procedure

### Standard Restore

1. Submit restore request with: data/system, point-in-time, justification
2. Security Lead approves restore request
3. Restore from most recent verified backup
4. Verify restored data integrity
5. Document restore event: date, data restored, verified by

### Disaster Recovery Restore

1. Activate disaster recovery plan
2. Prioritize systems for restore based on business criticality
3. Restore from latest known-good backup
4. Verify system functionality and data integrity
5. Conduct post-restore security scan
6. Document full recovery timeline

## Testing

- Backup restoration shall be tested quarterly
- Test results shall be documented and reviewed by Security Lead
- Failed tests shall trigger immediate investigation and remediation

## References

- `policies/data-retention-policy.md`
- `compliance/control-matrix.csv` (CP-1)
- `templates/control-test-template.md`
