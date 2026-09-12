<#
.SYNOPSIS
  从 templates 骨架初始化一个新的个人知识库。
.EXAMPLE
  pwsh scripts/init.ps1 -Path "D:\我的知识库"
.EXAMPLE
  pwsh scripts/init.ps1 -Path "D:\我的知识库" -Force -NoGitInit
#>
param(
  [Parameter(Mandatory = $true, Position = 0)][string]$Path,
  [switch]$Force,
  [switch]$NoGitInit
)
$ErrorActionPreference = 'Stop'

$here     = Split-Path -Parent $MyInvocation.MyCommand.Path
$template = Join-Path (Split-Path -Parent $here) 'assets\template'
if (-not (Test-Path -LiteralPath $template)) { throw "找不到模板目录：$template" }

$target = [IO.Path]::GetFullPath($Path)
if ((Test-Path -LiteralPath $target) -and -not $Force) {
  $existing = Get-ChildItem -LiteralPath $target -Force -ErrorAction SilentlyContinue
  if ($existing) { throw "目标目录非空：$target（加 -Force 可覆盖写入）" }
}
New-Item -ItemType Directory -Force -Path $target | Out-Null

# 复制骨架（含 .gitignore / .github / .cursor / .clinerules 等点文件）
Get-ChildItem -LiteralPath $template -Force | ForEach-Object {
  Copy-Item -LiteralPath $_.FullName -Destination $target -Recurse -Force
}
Write-Host "已复制骨架 -> $target" -ForegroundColor Green

if (-not $NoGitInit) {
  if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "未找到 git，跳过版本库初始化。" -ForegroundColor Yellow
  } else {
    git -C $target init -b main 2>$null | Out-Null
    if ($LASTEXITCODE -ne 0) { git -C $target init | Out-Null }
    git -C $target add -A
    git -C $target commit -m "chore: 初始化个人知识库骨架" | Out-Null
    Write-Host "已初始化 Git 仓库（main 分支）" -ForegroundColor Green
  }
}

Write-Host ""
Write-Host "下一步：" -ForegroundColor Cyan
Write-Host "  1) 打开该目录，让任意 AI 工具读取 AGENTS.md（多数工具会自动加载）"
Write-Host "  2) 把要整理的文件丢进 01-收件箱，然后让 AI 归位"
Write-Host "  3) 需要远端时（建议私有）：gh repo create my-knowledge-base --private --source=. --remote=origin --push"
