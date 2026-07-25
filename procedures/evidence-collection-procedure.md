# Evidence Collection Procedure

**Procedure ID**: PRO-EC-001
**Effective Date**: 2026-01-01
**Owner**: Compliance Officer
**Related Policy**: `policies/incident-response-policy.md`

## Overview

This procedure defines standards and steps for collecting, preserving, and documenting evidence for compliance audits and incident investigations.

## Evidence Types

| Type            | Description                              | Format          |
|-----------------|------------------------------------------|-----------------|
| Policy docs     | Current and historical policies          | Markdown        |
| System logs     | Authentication, access, security events  | JSON/CSV        |
| Screenshots     | Configuration screenshots with timestamps | PNG (signed)   |
| Audit reports   | Internal and external audit findings     | PDF (signed)    |
| Test results    | Control test outcomes                    | Markdown/CSV    |
| Communication   | Relevant emails, tickets, chat logs      | PDF export      |

## Collection Procedure

### Step 1: Planning

1. Identify evidence requirements from control matrix or investigation scope
2. Determine collection method and tools
3. Assign collector and establish timeline
4. Ensure collector has appropriate access and authorization

### Step 2: Collection

1. Collect evidence using approved tools and methods
2. Record metadata for each artifact:
   - Collection date and time
   - Collector identity
   - Source system/location
   - Description of evidence
3. Generate hash (SHA-256) of each evidence file for integrity verification

### Step 3: Preservation

1. Store evidence in tamper-evident storage
2. Apply write-protection to evidence files
3. Maintain chain of custody log documenting:
   - Each person who handled the evidence
   - Date/time of transfer
   - Purpose of access
4. Create backup copies stored separately

### Step 4: Cataloging

1. Assign unique evidence ID per `compliance/evidence-catalog.md`
2. Record in evidence catalog with all metadata
3. Link evidence to applicable controls or incidents
4. Set retention period per `policies/data-retention-policy.md`

### Step 5: Verification

1. Verify hash integrity after storage
2. Confirm evidence is readable and complete
3. Obtain reviewer sign-off on collected evidence
4. Document verification results

## Chain of Custody Template

| Date/Time | Action     | Person | Signature | Notes         |
|-----------|------------|--------|-----------|---------------|
|           | Collected  |        |           |               |
|           | Stored     |        |           |               |
|           | Reviewed   |        |           |               |
|           | Transferred|        |           |               |

## References

- `compliance/evidence-catalog.md`
- `templates/audit-evidence-template.md`
- `policies/data-retention-policy.md`
