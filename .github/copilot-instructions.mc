# GitHub Copilot Coding Agent Instructions

## Purpose

This repository uses GitHub Copilot Coding Agent to assist with software development.
All agents must follow these rules before making changes.

---

# 1. General Development Rules

## Code Quality

All changes must:

- Follow existing repository coding conventions.
- Prefer simple, maintainable solutions.
- Avoid unnecessary refactoring.
- Preserve backward compatibility unless explicitly approved.
- Include appropriate tests for changed behavior.

## Before Changing Code

The agent must:

1. Understand the issue requirements.
2. Inspect the existing implementation.
3. Identify impacted components.
4. Evaluate risks and dependencies.

Do not modify code based only on assumptions.

---

# 2. Planning Requirement

## Plan Before Implementation

For non-trivial changes:

A plan must be created before implementation.

The plan must include:

## Summary

What problem is being solved.

## Proposed Changes

Detailed implementation approach.

## Files Impacted

List affected files and components.

## Dependencies

Identify impacted services, APIs, databases, or infrastructure.

## Testing Strategy

Describe validation approach.

## Risks

Identify possible failure scenarios.

## Rollback Plan

Describe how changes can be reverted.

---

# 3. Repository Exploration

Before making changes:

Review:

- Existing code patterns.
- Similar implementations.
- Configuration files.
- Existing tests.
- Database dependencies.
- API contracts.

Prefer extending existing patterns over introducing new ones.

---

# 4. Code Change Rules

## Source Code

When modifying code:

- Keep changes focused.
- Avoid unrelated cleanup.
- Do not remove existing functionality unless required.
- Add comments only when logic is not obvious.

## Dependencies

Before adding dependencies:

Evaluate:

- Security impact.
- Maintenance status.
- License compatibility.
- Existing alternatives.

---

# 5. Testing Requirements

Every implementation must include validation.

Required:

- Build must pass.
- Existing tests must pass.
- New behavior must have tests.

Preferred:

- Unit tests.
- Integration tests.
- Regression tests.

Testing evidence must be included in the PR.

---

# 6. Pull Request Requirements

Every PR must include:

## Summary

What changed and why.

## Implementation Plan

The approved approach.

## Files Impacted

Important files changed.

## Testing Strategy

Tests executed and results.

## Risks

Potential impacts.

## Rollback Plan

How to safely revert.

## Evidence

Include:

- Workflow run links.
- Test results.
- Build artifacts.
- Security scan results.

---

# 7. Safe Iteration Policy

Failures are expected.

When a required check fails:

The agent may:

1. Analyze the failure.
2. Update the branch.
3. Rerun validation.

Maximum retry policy:

- First failure:
  - Investigate.
  - Apply fix.
  - Rerun checks.

- Second failure:
  - Stop automatic iteration.
  - Escalate to human review.

The escalation summary must include:

- What failed.
- What was attempted.
- Evidence collected.
- Recommended next step.

---

# 8. Security Rules

Agents must:

Never:

- Commit secrets.
- Store credentials in source code.
- Disable security controls.
- Bypass authentication or authorization checks.

Security-sensitive changes require:

- Security review.
- Additional validation.
- Clear rollback plan.

---

# 9. Database Change Rules

Database changes require:

Documentation of:

- Schema impact.
- Data impact.
- Performance considerations.
- Migration steps.
- Rollback strategy.

Production database changes require:

- Backup verification.
- Deployment approval.
- Migration validation.

---

# 10. API Change Rules

API changes must document:

- Endpoint changes.
- Request/response changes.
- Backward compatibility.
- Client impact.

Breaking changes require:

- Migration strategy.
- Deprecation plan.
- Consumer notification.

---

# 11. MCP Tool Usage Rules

MCP tools must follow least-privilege principles.

Agents must:

- Use only required tools.
- Prefer read-only access when possible.
- Avoid production access unless explicitly approved.

Environment access:

## Development

Allowed:

- Code changes.
- Development resources.
- Test execution.

## Test

Allowed:

- Validation.
- Integration testing.

## Production

Restricted:

- No direct modification.
- Deployment only through approved workflows.

---

# 12. Environment Rules

Deployment must follow:

Development:
- Automatic deployment allowed.

Test:
- Approval may be required.

Production:
- Requires environment protection approval.

Agents must never:

- Deploy directly to production.
- Modify production resources outside approved workflows.

---

# 13. Observability Requirements

Changes affecting runtime behavior must consider:

- Logging.
- Metrics.
- Tracing.
- Error handling.
- Monitoring impact.

The PR must document:

- New telemetry.
- Operational impact.
- Troubleshooting information.

---

# 14. Commit Guidelines

Commits should:

- Be small and focused.
- Describe the intent.
- Avoid unrelated changes.

Preferred format:
