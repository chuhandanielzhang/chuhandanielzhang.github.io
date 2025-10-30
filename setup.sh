#!/bin/bash

echo "🎉 欢迎使用 GitHub Pages 网站部署工具！"
echo ""
echo "请提供以下信息："
echo ""

# 检查 Git 配置
if [ -z "$(git config user.name)" ] || [ -z "$(git config user.email)" ]; then
    read -p "请输入你的 GitHub 用户名: " GITHUB_USERNAME
    read -p "请输入你的 GitHub 邮箱: " GITHUB_EMAIL
    
    echo ""
    echo "正在配置 Git..."
    git config --global user.name "$GITHUB_USERNAME"
    git config --global user.email "$GITHUB_EMAIL"
    echo "✅ Git 配置完成"
else
    GITHUB_USERNAME=$(git config user.name)
    GITHUB_EMAIL=$(git config user.email)
    echo "✅ 检测到 Git 配置："
    echo "   用户名: $GITHUB_USERNAME"
    echo "   邮箱: $GITHUB_EMAIL"
    echo ""
fi

read -p "请输入仓库名称 (例如: my-website): " REPO_NAME
echo ""

# 配置确认
echo "================================"
echo "配置信息确认："
echo "  用户名: $GITHUB_USERNAME"
echo "  邮箱: $GITHUB_EMAIL"
echo "  仓库名: $REPO_NAME"
echo "================================"
echo ""
read -p "确认以上信息正确吗？(y/n): " CONFIRM

if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "❌ 已取消操作"
    exit 1
fi

echo ""
echo "🚀 开始部署..."

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
git commit -m "Initial commit: My GitHub Pages website"

# 添加远程仓库（如果不存在）
echo "🔗 设置远程仓库..."
if git remote | grep -q "origin"; then
    git remote set-url origin "https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"
else
    git remote add origin "https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"
fi

# 重命名分支
git branch -M main

echo ""
echo "================================"
echo "✅ 本地准备完成！"
echo "================================"
echo ""
echo "接下来请按以下步骤操作："
echo ""
echo "1️⃣  在浏览器中访问并创建仓库："
echo "   👉 https://github.com/new"
echo ""
echo "2️⃣  仓库名称填写: $REPO_NAME"
echo "3️⃣  选择 Public"
echo "4️⃣  ❌ 不要勾选任何初始化选项"
echo "5️⃣  点击 'Create repository'"
echo ""
read -p "仓库创建好后，按回车继续推送代码..."

echo ""
echo "⬆️  推送到 GitHub..."
if git push -u origin main; then
    echo ""
    echo "================================"
    echo "🎉 部署成功！"
    echo "================================"
    echo ""
    echo "最后一步：启用 GitHub Pages"
    echo ""
    echo "1️⃣  访问：https://github.com/${GITHUB_USERNAME}/${REPO_NAME}/settings/pages"
    echo "2️⃣  在 'Source' 选择："
    echo "   - Branch: main"
    echo "   - Folder: / (root)"
    echo "3️⃣  点击 'Save'"
    echo ""
    echo "等待 1-2 分钟后，网站即可访问："
    if [ "$REPO_NAME" = "${GITHUB_USERNAME}.github.io" ]; then
        echo "   🌐 https://${GITHUB_USERNAME}.github.io"
    else
        echo "   🌐 https://${GITHUB_USERNAME}.github.io/${REPO_NAME}"
    fi
else
    echo ""
    echo "================================"
    echo "❌ 推送失败"
    echo "================================"
    echo ""
    echo "可能的原因："
    echo "1. 仓库尚未创建"
    echo "2. 需要使用个人访问令牌 (Personal Access Token)"
    echo "3. 网络连接问题"
    echo ""
    echo "如果仓库已创建，可能需要："
    echo "1. 访问：https://github.com/settings/tokens"
    echo "2. 生成新的个人访问令牌"
    echo "3. 使用以下命令推送："
    echo "   git push -u origin main"
    echo ""
fi

