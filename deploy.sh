#!/bin/bash
# 一键部署三江强推数据到GitHub Pages
# 用法：bash deploy.sh [数据目录]

set -e

PAGES_DIR="$HOME/.proma/agent-workspaces/default/qidian-sanjiang-pages"
DATA_DIR="${1:-$HOME/.proma/agent-workspaces/default/fc00fb7d-1053-4f5e-a523-35020ebb5c2e}"

echo "=========================================="
echo "  三江强推 GitHub Pages 部署"
echo "=========================================="

# 复制HTML文件
echo "[1/3] 复制数据文件..."
cp "$DATA_DIR"/三江强推_*.html "$PAGES_DIR/" 2>/dev/null || {
    echo "错误：未找到HTML文件"
    exit 1
}

# 提交并推送
echo "[2/3] 推送到GitHub..."
cd "$PAGES_DIR"
git add -A
git commit -m "更新扫榜数据 $(date +%Y%m%d_%H%M)" || echo "没有新变更"
git push origin main

echo "[3/3] 完成！"
echo ""
echo "=========================================="
echo "  访问地址："
echo "  https://lisiyan-cheer.github.io/qidian-sanjiang-pages/"
echo "=========================================="
