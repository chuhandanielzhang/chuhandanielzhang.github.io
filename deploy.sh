#!/bin/bash

# GitHub Pages 部署脚本
# 使用说明：
# 1. 将 da7acc2ch 和 REPO_NAME 替换为你的实际 GitHub 用户名和仓库名
# 2. 运行: chmod +x deploy.sh
# 3. 运行: ./deploy.sh

# 配置信息（请修改为你的信息）
GITHUB_USERNAME="da7acc2ch"
REPO_NAME="chuhanzhang.github.io"

echo "🚀 开始部署 GitHub Pages 网站..."

# 检查是否已初始化 Git
if [ ! -d ".git" ]; then
    echo "📦 初始化 Git 仓库..."
    git init
fi

# 添加所有文件
echo "📝 添加文件到 Git..."
git add .

# 提交更改
echo "💾 提交更改..."
git commit -m "Deploy website $(date '+%Y-%m-%d %H:%M:%S')" || echo "没有更改需要提交"

# 添加远程仓库（如果不存在）
echo "🔗 设置远程仓库..."
if ! git remote | grep -q "origin"; then
    git remote add origin "https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"
fi

# 推送到 GitHub
echo "⬆️  推送到 GitHub..."
git branch -M main
git push -u origin main

echo "✅ 部署完成！"
echo "📖 请在 GitHub 仓库的 Settings > Pages 中启用 GitHub Pages"
echo "🌐 网站地址: https://${GITHUB_USERNAME}.github.io/${REPO_NAME}"

