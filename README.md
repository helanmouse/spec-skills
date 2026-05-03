# Spec Skills / Spec 技能库

While using [superpowers](https://github.com/obra/superpowers), we found that its spec skills often miss the user's true intent. This is a collection of skills designed to complement superpowers — making AI coding agents better at understanding what you actually mean. Each skill is an independent plugin; install only what you need.

在使用 [superpowers](https://github.com/obra/superpowers) 的过程中，我们发现其 spec 技能常常不能准确理解用户的真实意图。这里的一系列技能专为补充 superpowers 而设计——让 AI 编程代理更懂你的真正需求。每个技能都是独立插件，按需安装即可。

## Available Plugins / 可用插件

| Plugin / 插件 | Description / 描述 |
|---------------|-------------------|
| **ask-me** | Refine design documents by asking only about architectural decisions; the AI decides everything else autonomously / 仅针对架构决策进行提问以完善设计文档，其余事项由 AI 自主决定 |

## Installation / 安装

**Note:** Installation differs by platform. Claude Code has a built-in plugin marketplace. Codex and other agents require manual setup.

**注意：** 安装方式因平台而异。Claude Code 有内置的插件市场。Codex 和其他代理需要手动设置。

### Claude Code

In Claude Code, add the marketplace first, then install individual plugins:

在 Claude Code 中，先添加市场，再安装单个插件：

```bash
# Add the marketplace / 添加市场
/plugin marketplace add helanmouse/spec-skills

# Install a plugin / 安装插件
/plugin install ask-me@spec-skills
```

To update / 更新：

```bash
/plugin marketplace update spec-skills
```

### Codex

Tell Codex / 告诉 Codex：

```
Fetch and follow instructions from https://raw.githubusercontent.com/helanmouse/spec-skills/refs/heads/main/.codex/INSTALL.md
```

### Manual / 手动安装

Clone the repository and copy skills to `~/.agents/skills/`:

克隆仓库并将技能复制到 `~/.agents/skills/`：

```bash
git clone https://github.com/helanmouse/spec-skills.git /tmp/spec-skills
mkdir -p ~/.agents/skills
cp -r /tmp/spec-skills/plugins/*/skills/* ~/.agents/skills/
rm -rf /tmp/spec-skills
```

Then add to your agent's instruction file (`AGENTS.md`, `CLAUDE.md`, etc.):

然后添加到你的代理指令文件中（`AGENTS.md`、`CLAUDE.md` 等）：

```markdown
Load and follow skills from ~/.agents/skills/ when relevant tasks arise. Each skill is a directory containing a SKILL.md with instructions.

当相关任务出现时，从 ~/.agents/skills/ 加载并遵循技能。每个技能是一个包含 SKILL.md 指令文件的目录。
```

### Verify Installation / 验证安装

Start a new session and provide a design document. The agent should ask targeted architectural questions (module boundaries, thread model, lifecycle, failure recovery, interface contracts) rather than all possible questions.

开启一个新会话并提供一份设计文档。代理应针对架构问题（模块边界、线程模型、生命周期、故障恢复、接口契约）进行精准提问，而非事无巨细地提问。

## License / 许可证

MIT
