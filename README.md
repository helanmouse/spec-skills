# Spec Skills

Custom skills library for AI coding agents, inspired by [superpowers](https://github.com/obra/superpowers). Provides composable "skills" that enforce disciplined software development workflows.

## Skills

| Skill | Description |
|-------|-------------|
| **ask-me** | Refine design documents by asking only about architectural decisions; the AI decides everything else autonomously |

## Installation

### Claude Code

Add the marketplace first, then install the plugin:

```bash
# Step 1: Add the marketplace
/plugin marketplace add helanmouse/spec-skills

# Step 2: Install the plugin
/plugin install spec-skills@spec-skills
```

### Local Testing

Test locally before publishing:

```bash
/plugin marketplace add ./path/to/spec-skills
/plugin install spec-skills@spec-skills
```

## Project Structure

```
spec-skills/
├── .claude-plugin/       # Claude Code plugin registration
├── hooks/                # Session lifecycle hooks
│   ├── hooks.json        # Hook configuration
│   └── session-start.sh  # Auto-injects skill list on session start
├── skills/               # Skills directory
│   ├── ask-me/           # Architectural decision refinement
│   │   └── SKILL.md
│   └── ...               # Future skills go here
├── package.json
└── README.md
```

## Adding New Skills

1. Create a new directory under `skills/` with a kebab-case name
2. Add a `SKILL.md` with frontmatter (`name`, `description`) and skill content
3. Follow the pattern established by existing skills
4. The session-start hook will auto-discover new skills

### SKILL.md Template

```markdown
---
name: skill-name
description: Use when [specific triggering condition]
---

# Skill Name

## Overview
One or two sentences describing the skill's core principle.

## When to Use
- Specific triggering conditions

## Core Pattern
Step-by-step process flow.

## Completion Criteria
When the skill's work is done.
```

## License

MIT
