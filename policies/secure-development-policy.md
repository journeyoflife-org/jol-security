# Secure Development Policy

**Policy ID**: POL-SD-001
**Effective Date**: 2026-01-01
**Review Cycle**: Annually
**Owner**: Security Lead
**Classification**: Internal

## Purpose

This policy establishes security requirements for the software development lifecycle (SDLC).

## Scope

Applies to all software development activities within the Journey of Life organization.

## Policy Statements

### 1. Security in SDLC

- Security requirements shall be defined during the design phase
- Threat modeling shall be conducted for all new features and significant changes
- Security testing shall be integrated into the CI/CD pipeline

### 2. Code Security

- All code shall be reviewed for security vulnerabilities before merge
- Static application security testing (SAST) shall run on every pull request
- Dynamic application security testing (DAST) shall run on every release
- Dependencies shall be scanned for known vulnerabilities

### 3. Development Environment

- Production data shall not be used in development or testing environments
- Development environments shall be isolated from production networks
- Secrets shall never be committed to version control

### 4. Change Management

- All changes shall go through peer review
- Changes to security controls require Security Lead approval
- Emergency changes shall follow `runbooks/emergency-change-runbook.md`

### 5. Deployment Security

- Deployments shall be automated and repeatable
- Rollback procedures shall be documented and tested
- Production deployments require at least one approval

## References

- `ci/pipeline-security.yml`
- `runbooks/emergency-change-runbook.md`
- `compliance/control-matrix.csv` (CM-1)
