# Evidence Pointers

## Overview

This directory contains pointers and indexes to evidence artifacts stored in external systems or locations that cannot be directly included in this repository.

## Purpose

Not all audit evidence can be stored in version control (e.g., system logs, screenshots of live dashboards, signed PDF reports). This directory provides:

- References to evidence stored in external secure storage
- Index files mapping controls to their evidence locations
- Links to audit reports in restricted-access systems

## Usage

When evidence is collected but stored externally:

1. Create a pointer file in this directory
2. Include: evidence ID, description, external location, access instructions
3. Reference the pointer in `compliance/evidence-catalog.md`

## Template

```markdown
# Evidence Pointer: [EV-YYYY-NNN]

**Control**: [Control ID]
**Description**: [What this evidence shows]
**External Location**: [URL or system path]
**Access Required**: [Role/clearance needed]
**Collected**: [Date]
**Collector**: [Name]
**Retention**: [Period]
```

## References

- `compliance/evidence-catalog.md`
- `procedures/evidence-collection-procedure.md`
