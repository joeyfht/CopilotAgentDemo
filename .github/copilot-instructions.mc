# Repository Engineering Standards

These instructions apply to every GitHub Copilot Coding Agent working in this repository.

---

# Engineering Principles

Always prefer:

- simplicity
- readability
- maintainability
- testability
- security
- reliability

Do not introduce unnecessary complexity.

---

# Planning

Before making changes:

- understand the issue
- investigate the affected code
- understand dependencies
- identify impacted components
- consider edge cases

Never guess.

---

# Code Quality

Code should:

- follow existing repository conventions
- be self-documenting
- avoid duplication
- avoid dead code
- avoid unnecessary abstractions

---

# Testing

Every functional change should include appropriate tests whenever practical.

Consider:

- unit tests
- integration tests
- regression tests

---

# Security

Never:

- hardcode secrets
- commit credentials
- bypass authentication
- weaken authorization
- expose sensitive information

Use secure defaults.

---

# Reliability

Assume failures will occur.

Design for:

- retries
- validation
- logging
- graceful failure

---

# Git

Keep commits focused.

Avoid unrelated changes.

Do not reformat unrelated files.

---

# Pull Requests

Every PR should clearly explain:

- what changed
- why
- risks
- testing performed

---

# CI

The repository requires:

- CI Validation
- Plan Validation
- Security Scan

All required checks must pass before merge.

---

# When Uncertain

State assumptions.

Do not invent implementation details.

Prefer asking for clarification over guessing.