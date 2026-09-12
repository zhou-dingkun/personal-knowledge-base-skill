#!/usr/bin/env bash
# 从模板骨架初始化一个新的个人知识库。
# 用法: bash scripts/init.sh <目标目录>
set -euo pipefail

TARGET="${1:-}"
if [ -z "$TARGET" ]; then
  echo "用法: bash scripts/init.sh <目标目录>" >&2
  exit 1
fi

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE="$(dirname "$HERE")/assets/template"
if [ ! -d "$TEMPLATE" ]; then
  echo "找不到模板目录: $TEMPLATE" >&2
  exit 1
fi

mkdir -p "$TARGET"
# 复制骨架（含 .gitignore / .github / .cursor / .clinerules 等点文件）
cp -R "$TEMPLATE"/. "$TARGET"/
echo "已复制骨架 -> $TARGET"

if command -v git >/dev/null 2>&1; then
  git -C "$TARGET" init -b main >/dev/null 2>&1 || git -C "$TARGET" init >/dev/null
  git -C "$TARGET" add -A
  git -C "$TARGET" commit -m "chore: 初始化个人知识库骨架" >/dev/null 2>&1 || true
  echo "已初始化 Git 仓库（main 分支）"
else
  echo "未找到 git，跳过版本库初始化。" >&2
fi

echo
echo "下一步："
echo "  1) 打开该目录，让任意 AI 工具读取 AGENTS.md（多数工具会自动加载）"
echo "  2) 把要整理的文件丢进 01-收件箱，然后让 AI 归位"
echo "  3) 需要远端时（建议私有）：gh repo create my-knowledge-base --private --source=. --remote=origin --push"
