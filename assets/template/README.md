# 个人知识库

纯 Markdown + 原始文件 + Git 的个人知识库。**AI 友好、零厂商锁定、可长期演进。**

## 目录结构（四区 + 作业 + 工具 + 模板）

| 目录 | 用途 | 生命周期 |
|---|---|---|
| `01-收件箱` | 临时剪藏、随手笔记、灵感（未整理） | 定期清空归位 |
| `02-资料库` | 原始材料：证书、PDF、扫描件、图片 | 原始文件只增不改 |
| `03-笔记` | 整理后的知识笔记，按主题分子目录 | 长期维护 |
| `04-项目` | 进行中的项目 / 课题 / 论文 | 完成后归档 |
| `05-作业` | AI 依据知识库协助完成的作业（**每个作业一个文件夹**） | 保留为记录 |
| `06-Agent工具` | 工具脚本、用法说明与本机环境说明 | 工具文档 |
| `00-模板` | 笔记 / 作业模板 | 只读参考 |

流转模型：**收件箱 → 资料库 / 笔记 / 项目**。详见根目录 `AGENTS.md`。

## AI 自动加载配置

| 文件 | 加载时机 | 说明 |
|---|---|---|
| `AGENTS.md`（根） | 多数 AI 工具会话开始自动加载 | 知识库总规范 |
| 各子目录 `AGENTS.md` | AI 处理该目录内容时自动加载 | 该区域专属规则，优先级更高 |
| `AGENTS.local.md` | 自动加载（本机） | 私有覆盖层，已 gitignore |
| `CLAUDE.md` / `.github/copilot-instructions.md` / `.cursor/rules/` / `.clinerules/` | 各工具各自读取 | 均指向 `AGENTS.md` 的指针 |

## Git 使用

```bash
git add -A
git status                     # 检查无敏感文件
git commit -m "docs: 添加笔记 xxx"
git log --oneline -10
git push
```

配置远端（可选）：

```bash
# 私有仓库（推荐，资料常含个人信息）
gh repo create my-knowledge-base --private --source=. --remote=origin --push
```

## 约定速览

- 每篇笔记带 YAML frontmatter（type / title / tags / created / updated / status）
- 命名：笔记 `YYYYMMDD-简短描述.md`；资料 `主题-描述.ext`
- 每个入库 PDF / 图片配一个同名 `.md` 索引笔记
- 内部链接优先用相对路径
- 改完更新 `updated` 与 `INDEX.md`
- **隐私红线**：敏感材料不进公开仓库、不外发

> 本库由 [personal-knowledge-base-skill](https://github.com/) 脚手架生成。
