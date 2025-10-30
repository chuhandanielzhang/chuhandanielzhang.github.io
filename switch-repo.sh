#!/bin/bash

# 快速切换仓库名的脚本

echo "🔄 切换 GitHub 仓库名"
echo "===================="
echo ""
echo "请选择新的仓库名："
echo "1. my-personal-website"
echo "2. chuhan-zhang-portfolio"
echo "3. portfolio-2024"
echo "4. chuhanzhang-website"
echo "5. 自定义（请输入）"
echo ""
read -p "请选择 (1-5): " choice

case $choice in
    1)
        NEW_REPO="my-personal-website"
        ;;
    2)
        NEW_REPO="chuhan-zhang-portfolio"
        ;;
    3)
        NEW_REPO="portfolio-2024"
        ;;
    4)
        NEW_REPO="chuhanzhang-website"
        ;;
    5)
        read -p "请输入自定义仓库名: " NEW_REPO
        ;;
    *)
        echo "无效选择"
        exit 1
        ;;
esac

echo ""
echo "你选择: $NEW_REPO"
read -p "确认创建这个仓库并推送代码？(y/N): " confirm

if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo "操作已取消"
    exit 0
fi

echo ""
echo "📍 请先在 GitHub 创建仓库:"
echo ""
echo "   1. 访问: https://github.com/new"
echo "   2. Repository name: $NEW_REPO"
echo "   3. 选择 Public"
echo "   4. 不要勾选任何选项"
echo "   5. 点击 Create repository"
echo ""
read -p "创建完成后按 Enter 继续..."

echo ""
echo "🔄 更新远程仓库地址..."
git remote set-url origin "https://github.com/da7acc2ch/$NEW_REPO.git"

echo ""
echo "⬆️  推送代码到新仓库..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 成功！代码已推送到新仓库"
    echo ""
    echo "📋 接下来的步骤："
    echo "   1. 访问: https://github.com/da7acc2ch/$NEW_REPO"
    echo "   2. 点击 Settings → Pages"
    echo "   3. Source 选择 'Deploy from a branch'"
    echo "   4. Branch 选择 'main'"
    echo "   5. 点击 Save"
    echo ""
    echo "🌐 网站地址："
    echo "   https://da7acc2ch.github.io/$NEW_REPO/"
    echo ""
else
    echo ""
    echo "❌ 推送失败！请检查："
    echo "   1. 仓库是否已创建"
    echo "   2. 网络连接是否正常"
    echo "   3. Token 是否有效"
fi

