# Emergency Change Runbook

**Runbook ID**: RB-EC-001
**Purpose**: Execute emergency changes to security controls or configurations during active incidents
**Frequency**: As needed (during P1/P2 incidents)
**Activation**: Declared by Security Lead or CISO during P1/P2 incidents

## Prerequisites

- Active incident ticket with P1/P2 severity classification
- Security Lead or CISO authorization (verbal or written)
- Access to affected systems
- Communication channel established with IR team

## Procedure

### Step 1: Change Authorization

1. Document the emergency change request:
   - What: Description of the change
   - Why: Incident driving the need
   - Impact: Systems and users affected
   - Rollback: How to revert if unsuccessful
2. Obtain verbal approval from Security Lead (follow up with written within 24 hours)
3. Notify all stakeholders of the pending change

### Step 2: Pre-Change Snapshot

1. Capture current configuration state
2. Take backup of affected configurations
3. Document current system behavior and baseline metrics
4. Ensure rollback materials are ready

### Step 3: Execute Change

1. Apply the change during the smallest possible maintenance window
2. Monitor system health continuously during execution
3. Document each action taken with timestamps
4. If change fails or causes unexpected impact, execute rollback immediately

### Step 4: Verification

1. Verify the change achieved its intended effect
2. Confirm no regression in related systems
3. Run security validation checks
4. Obtain sign-off from Security Lead

### Step 5: Post-Change

1. Update incident report with change details
2. File formal change request retroactively (within 48 hours)
3. Schedule post-change review
4. Update relevant documentation and runbooks

## Rollback Procedure

1. Revert to pre-change snapshot
2. Verify system stability
3. Notify stakeholders of rollback
4. Investigate root cause of change failure
5. Plan corrective action

## Communication Template

```
EMERGENCY CHANGE NOTIFICATION
Incident: [ID]
Change: [Description]
Authorized by: [Name]
Start time: [Timestamp]
Expected duration: [Duration]
Rollback plan: [Summary]
Contact: [Name/Channel]
```

## References

- `policies/secure-development-policy.md`
- `procedures/incident-response-procedure.md`
- `runbooks/security-triage-runbook.md`
