# 个人知识库 · 组织架构 Skill

> 把个人资料、证书、笔记、项目、作业组织成一个**纯 Markdown + 原始文件 + Git** 的知识库。
> 跨 AI 工具通用（DSH / Claude Code / Cursor / Copilot / Codex / Cline / Windsurf），零厂商锁定。

[English](#english) | 中文

## 它解决什么问题

大多数人整理资料失败，不是因为不勤奋，而是因为：

- **工具绑架**——用某个笔记软件存了几年，一停服/改收费就搬不出来
- **分类焦虑**——"这条该放哪"想太久，最后干脆不记
- **AI 用不上**——资料是散落的 PDF/截图，AI 读不到、读不动
- **无版本、无备份**——改错了回不去，硬盘坏了就没了

这个 skill 给出的答案：**纯文本 + 四区流转 + 规范即接口**。

## 四区流转模型

```
01-收件箱  ──归位──▶  02-资料库（原始材料 + 索引笔记）
（先存下来）          03-笔记  （整理后的知识）
                      04-项目  （进行中的事）
05-作业 / 06-Agent工具 / 00-模板
```

| 目录 | 用途 | 生命周期 |
|---|---|---|
| `01-收件箱` | 临时剪藏、随手笔记、灵感 | 定期清空归位 |
| `02-资料库` | 证书 / PDF / 扫描件 / 图片，按主题分子目录 | 原始文件只增不改 |
| `03-笔记` | 知识笔记，按主题分子目录 | 长期维护 |
| `04-项目` | 项目 / 课题 / 论文 | 完成后归档 |
| `05-作业` | AI 协助的作业，**每个作业一个文件夹** | 保留为记录 |
| `06-Agent工具` | 本机工具脚本与环境说明 | 工具文档 |
| `00-模板` | 笔记 / 作业模板 | 只读参考 |

## 快速开始

```powershell
# Windows
pwsh scripts/init.ps1 -Path "D:\我的知识库"
```
```bash
# macOS / Linux
bash scripts/init.sh ~/my-kb
```

或手工复制 `assets/template/` 到你的目标目录。生成的知识库自带：

- `AGENTS.md`（通用规范，多数 agent 自动加载）+ 各子目录专属规则
- `CLAUDE.md` / `.github/copilot-instructions.md` / `.cursor/rules/` / `.clinerules/`（各工具入口，全部指向 `AGENTS.md`）
- `INDEX.md` 活索引、`00-模板/` 模板、`.gitignore`

## 跨 Agent 安装（本 skill 本身）

本仓库根就是 skill bundle（`SKILL.md`）。详见 [`references/cross-agent.md`](references/cross-agent.md)。

| 工具 | 放置位置 |
|---|---|
| **DSH** | `.agents/skills/personal-knowledge-base/` 或 `~/.agents/skills/…`；也扫描 `.dsh/skills`、`~/.dsh/skills` |
| **Claude Code** | `.claude/skills/personal-knowledge-base/` 或 `~/.claude/skills/…` |
| **Cursor / Copilot / Codex / Cline / Windsurf** | 在本仓库内工作时读根 `AGENTS.md` / `.cursor/rules/` / `.github/copilot-instructions.md` / `.clinerules/`；生成的库里同样有一套 |

## 仓库结构

```
personal-knowledge-base-skill/
├── SKILL.md                 # 技能本体（规范全文）
├── AGENTS.md                # 通用 agent 入口
├── CLAUDE.md                # Claude Code 入口
├── .github/copilot-instructions.md
├── .cursor/rules/personal-knowledge-base.mdc
├── .clinerules/personal-knowledge-base.md
├── references/
│   ├── conventions.md       # 细则（frontmatter/命名/标签/工作流/Git/隐私）
│   └── cross-agent.md       # 各工具安装位置与兼容矩阵
├── assets/template/         # 可复制的知识库骨架
└── scripts/init.ps1 | init.sh
```

## 设计取舍

- **为什么纯文本**：无厂商锁定、AI 最易索引、可用任何编辑器与版本控制
- **为什么"收件箱"独立**：记录与整理的摩擦要分开，先存后整
- **为什么每个原始文件配索引**：AI 读 Markdown 成本远低于解析 PDF/图片，且索引强制你写清"这是什么"
- **为什么隐私分级**：知识库天然含敏感信息，先定边界再谈便利

## License

MIT —— 见 [LICENSE](LICENSE)。

---

<a id="english"></a>
## English

**Personal Knowledge Base — an agent-agnostic organization skill.**

A plain-text (Markdown + originals + Git) personal knowledge base organized as four flowing zones
(inbox → library / notes / projects), plus homework and local-tooling zones. Ships `AGENTS.md`
conventions that most AI coding agents auto-load, so any agent can read **and write** the base.

Install as a skill bundle by copying this repo into your agent's skills directory
(DSH: `.agents/skills/` or `~/.agents/skills/`; Claude Code: `.claude/skills/` or `~/.claude/skills/`),
or copy `assets/template/` to bootstrap a new knowledge base.

MIT licensed.
