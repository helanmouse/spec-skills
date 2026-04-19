# Installing spec-skills for Codex

## Quick Install

Tell Codex:

```
Fetch and follow instructions from https://raw.githubusercontent.com/helanmouse/spec-skills/refs/heads/main/.codex/INSTALL.md
```

## Setup

1. Clone the repository:

```bash
git clone https://github.com/helanmouse/spec-skills.git ~/.spec-skills
```

2. Create a Codex instructions file in your project (or add to an existing one). For each skill you want, add the skill content to your `AGENTS.md` or project instructions:

```bash
# Example: add ask-me skill to your project
cat ~/.spec-skills/plugins/ask-me/skills/ask-me/SKILL.md >> AGENTS.md
```

3. Alternatively, reference the raw skill URL directly in your `AGENTS.md`:

```markdown
Read and follow the ask-me skill from https://raw.githubusercontent.com/helanmouse/spec-skills/refs/heads/main/plugins/ask-me/skills/ask-me/SKILL.md
```

## Available Skills

- **ask-me** - Refine design documents by asking only about architectural decisions; the AI decides everything else autonomously

## Verify

Start a new Codex session and provide a design document. Codex should ask targeted architectural questions rather than all possible questions.
