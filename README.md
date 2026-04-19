# Spec Skills

Custom skills marketplace for AI coding agents, inspired by [superpowers](https://github.com/obra/superpowers). Each skill is an independent plugin — install only what you need.

## Available Plugins

| Plugin | Description |
|--------|-------------|
| **ask-me** | Refine design documents by asking only about architectural decisions; the AI decides everything else autonomously |

## Installation

**Note:** Installation differs by platform. Claude Code has a built-in plugin marketplace. Codex and other agents require manual setup.

### Claude Code

In Claude Code, add the marketplace first, then install individual plugins:

```bash
# Add the marketplace
/plugin marketplace add helanmouse/spec-skills

# Install a plugin
/plugin install ask-me@spec-skills
```

To update:

```bash
/plugin marketplace update spec-skills
```

### Codex

Tell Codex:

```
Fetch and follow instructions from https://raw.githubusercontent.com/helanmouse/spec-skills/refs/heads/main/.codex/INSTALL.md
```

### Manual

Clone the repository and copy skills to `~/.agents/skills/`:

```bash
git clone https://github.com/helanmouse/spec-skills.git /tmp/spec-skills
mkdir -p ~/.agents/skills
cp -r /tmp/spec-skills/plugins/*/skills/* ~/.agents/skills/
rm -rf /tmp/spec-skills
```

Then add to your agent's instruction file (`AGENTS.md`, `CLAUDE.md`, etc.):

```markdown
Load and follow skills from ~/.agents/skills/ when relevant tasks arise. Each skill is a directory containing a SKILL.md with instructions.
```

### Verify Installation

Start a new session and provide a design document. The agent should ask targeted architectural questions (module boundaries, thread model, lifecycle, failure recovery, interface contracts) rather than all possible questions.

## Project Structure

```
spec-skills/
├── .claude-plugin/
│   └── marketplace.json        # Marketplace registry
├── .codex/
│   └── INSTALL.md              # Codex setup instructions
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
