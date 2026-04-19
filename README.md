# Spec Skills

Custom skills marketplace for AI coding agents, inspired by [superpowers](https://github.com/obra/superpowers). Each skill is an independent plugin — install only what you need.

## Available Plugins

| Plugin | Description |
|--------|-------------|
| **ask-me** | Refine design documents by asking only about architectural decisions; the AI decides everything else autonomously |

## Installation

```bash
# Step 1: Add the marketplace
/plugin marketplace add helanmouse/spec-skills

# Step 2: Install a plugin
/plugin install ask-me@spec-skills
```

### Local Testing

```bash
/plugin marketplace add ./path/to/spec-skills
/plugin install ask-me@spec-skills
```

## Project Structure

```
spec-skills/
├── .claude-plugin/
│   └── marketplace.json        # Marketplace registry
├── plugins/
│   └── ask-me/                 # Independent plugin
│       ├── .claude-plugin/
│       │   └── plugin.json     # Plugin manifest
│       └── skills/
│           └── ask-me/
│               └── SKILL.md
├── package.json
└── README.md
```

## Adding New Plugins

1. Create a new directory under `plugins/` with a kebab-case name
2. Add `.claude-plugin/plugin.json` with name, description, version
3. Add `skills/<name>/SKILL.md` with frontmatter and skill content
4. Register the new plugin in `.claude-plugin/marketplace.json`
5. Commit and push — users can install immediately

### Plugin Template

```
plugins/my-skill/
├── .claude-plugin/
│   └── plugin.json
└── skills/
    └── my-skill/
        └── SKILL.md
```

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
