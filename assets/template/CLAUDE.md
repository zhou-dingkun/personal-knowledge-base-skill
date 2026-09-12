# CLAUDE.md — 兼容入口

> 权威规范见根目录 `AGENTS.md`（DSH / Claude Code / Cursor / Copilot 等自动加载）。本文件仅作指引，避免规范漂移。

## 请务必遵守 AGENTS.md 中的全部规则

- 目录结构：01-收件箱 / 02-资料库 / 03-笔记 / 04-项目 / 05-作业 / 06-Agent工具 / 00-模板
- 每篇笔记带 YAML frontmatter（type / title / tags / created / updated / status）
- 命名：`YYYYMMDD-简短描述.md`；每个入库 PDF / 图片配同名 `.md` 索引笔记
- 修改后更新 `updated` 与 `INDEX.md`
- Git 提交用约定式：`feat:` `fix:` `docs:` `chore:` `refactor:`
- 隐私红线：敏感材料不进公开仓库、不外发，引用用 `<已脱敏>`
- 处理子目录内容时，该目录下的 `AGENTS.md` 优先级更高
