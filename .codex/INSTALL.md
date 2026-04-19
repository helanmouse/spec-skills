# Installing spec-skills for Codex

## Quick Install

Tell Codex:

```
Fetch and follow instructions from https://raw.githubusercontent.com/helanmouse/spec-skills/refs/heads/main/.codex/INSTALL.md
```

## Setup

1. Clone the repository and copy skills to `~/.agents/skills/`:

```bash
git clone https://github.com/helanmouse/spec-skills.git /tmp/spec-skills
mkdir -p ~/.agents/skills
cp -r /tmp/spec-skills/plugins/*/skills/* ~/.agents/skills/
rm -rf /tmp/spec-skills
```

2. Add to your `AGENTS.md`:

```markdown
Load and follow skills from ~/.agents/skills/ when relevant tasks arise. Each skill is a directory containing a SKILL.md with instructions.
```

## Update

Re-run the setup commands to pull the latest versions:

```bash
git clone https://github.com/helanmouse/spec-skills.git /tmp/spec-skills
cp -r /tmp/spec-skills/plugins/*/skills/* ~/.agents/skills/
rm -rf /tmp/spec-skills
```

## Available Skills

- **ask-me** - Refine design documents by asking only about architectural decisions; the AI decides everything else autonomously

## Verify

Start a new Codex session and provide a design document. Codex should ask targeted architectural questions rather than all possible questions.
