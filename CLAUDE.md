# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a plugin marketplace for AI coding agent skills, inspired by [superpowers](https://github.com/obra/superpowers). Each plugin under `plugins/` is independently installable. Claude Code users install via `/plugin marketplace add` and `/plugin install`, while Codex and other agents use manual setup from `.codex/INSTALL.md`.

## Project Structure

```
spec-skills/
├── .claude-plugin/
│   └── marketplace.json        # Marketplace registry listing all plugins
├── .codex/
│   └── INSTALL.md              # Codex setup instructions
├── plugins/
│   └── <plugin-name>/          # Each plugin is independent
│       ├── .claude-plugin/
│       │   └── plugin.json     # Plugin manifest (name, description, version, author)
│       └── skills/
│           └── <skill-name>/
│               └── SKILL.md    # Skill content with YAML frontmatter
├── package.json                # Minimal: name, version, repo, license only (no scripts/deps)
└── README.md
```

## Adding a New Plugin

1. Create `plugins/<kebab-case-name>/.claude-plugin/plugin.json` with `name`, `description`, `version`, `author`, `homepage`, `repository`, `license`, `keywords`
2. Create `plugins/<kebab-case-name>/skills/<name>/SKILL.md` with YAML frontmatter (`name`, `description`) and markdown body
3. Register the plugin in `.claude-plugin/marketplace.json` under the `plugins` array with matching metadata plus `"source": "./plugins/<name>"`
4. If the skill should support Codex/manual install, update `.codex/INSTALL.md` with a description of the new skill

## SKILL.md Format

```markdown
---
name: skill-name
description: Use when [specific triggering condition]
---

# Skill Title

## Overview
...
```

Frontmatter fields: `name` (required), `description` (required — used by agents to decide when to invoke the skill).

## No Build System

This repo has no build step, dependencies, tests, or linting. `package.json` is metadata-only (no scripts). All content is hand-authored JSON and Markdown.
