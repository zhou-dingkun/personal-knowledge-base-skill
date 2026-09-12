# 跨 Agent 兼容与安装

> 目标：**同一个知识库，任何 AI 工具都能读、能写。** 本文件说明各工具的约定文件与安装位置。

## 1. 兼容的三个层次

| 层次 | 机制 | 谁在用 |
|---|---|---|
| **规范会** | `AGENTS.md`（根 + 各子目录） | DSH、Claude Code、Cursor、Copilot、Codex、Cline、Windsurf、Zed… |
| **工具有入口** | 各工具自己的入口文件，**只做指针，不重复内容** | `CLAUDE.md`、`.github/copilot-instructions.md`、`.cursor/rules/*.mdc`、`.clinerules/` |
| **技能可安装** | skill bundle：目录里的 `SKILL.md` | DSH、Claude Code（Agent Skills 约定） |

**唯一权威规范是 `AGENTS.md`**（本仓库中则是 `SKILL.md`）。其余文件只做指引，避免多份规范漂移。

## 2. 把本 skill 装到各工具

克隆本仓库到对应位置（目录名即 skill 名）：

```bash
git clone <repo-url> personal-knowledge-base
```

| 工具 | 项目级 | 用户级 |
|---|---|---|
| **DSH** | `<项目>/.agents/skills/personal-knowledge-base/` | `~/.agents/skills/personal-knowledge-base/` |
| **DSH（另一种）** | `<项目>/.dsh/skills/` | `~/.dsh/skills/` |
| **Claude Code** | `<项目>/.claude/skills/` | `~/.claude/skills/` |

DSH 的发现顺序（rank 由小到大，先到先得）：
`<项目>/.dsh/skills` → `<项目>/.agents/skills` → 自定义目录 → `<DSH_HOME>/skills` → `~/.agents/skills`。

要求：`SKILL.md` 必须位于**被扫描根目录的顶层**（即 `<root>/<name>/SKILL.md`），
**不支持**嵌套的 `**/SKILL.md`。frontmatter 必填 `name`（kebab-case）与 `description`。

> DSH 会监视这些根目录：新增/改名/删除 skill **无需重启**即可生效。

## 3. 在已有知识库里工作（不用装 skill）

生成的每个知识库都自带全套入口文件，**直接把该目录作为工作区打开即可**：

| 工具 | 它会读什么 |
|---|---|
| DSH | 根 `AGENTS.md`；处理子目录时读该目录的 `AGENTS.md`（更具体者优先） |
| Claude Code | `CLAUDE.md`（本模板中是指向 `AGENTS.md` 的指针）+ `AGENTS.md` |
| Cursor | `.cursor/rules/*.mdc` + `AGENTS.md` |
| GitHub Copilot | `.github/copilot-instructions.md` + `AGENTS.md` |
| Codex / Cline / Windsurf / Zed | `AGENTS.md`（部分工具另读 `.clinerules/`） |

若某个工具都不认，兜底做法：把 `AGENTS.md` 的内容直接粘进该工具的"系统提示 / 自定义指令"。

## 4. 本机私有覆盖层

需要放**本机专属**指令（路径、密钥环境变量名等）时，用覆盖层而不是改公共规范：

- `AGENTS.local.md` / `CLAUDE.local.md` —— 已默认写进 `.gitignore`，不进版本库
- DSH 会自动加载 `.local` 覆盖层

## 5. 常见坑

| 现象 | 原因 | 处理 |
|---|---|---|
| AI 不遵守规范 | 规范文件不在它扫描的位置/层级 | 确认 `AGENTS.md` 在项目根（含 `.git` 的目录）；子目录规则放在对应子目录 |
| 多个工具规则互相矛盾 | 同一规则抄了多份 | 只在 `AGENTS.md` 维护；其余文件写"见 AGENTS.md" |
| 新写的 skill 不出现 | 放到了嵌套目录 | 必须是扫描根的**一级**子目录 |
| `.local` 进了公开仓库 | 忘了 gitignore | 确认 `.gitignore` 含 `AGENTS.local.md` / `CLAUDE.local.md` |
