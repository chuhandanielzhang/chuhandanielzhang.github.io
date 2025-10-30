#!/bin/bash

# GitHub Pages 网站自动部署脚本
# 交互式版本 - 一步一步引导用户完成部署

echo "🌐 GitHub Pages 网站自动部署工具"
echo "=================================="
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 函数：打印彩色消息
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# 检查 Git 是否安装
check_git() {
    if ! command -v git &> /dev/null; then
        print_error "Git 未安装！请先安装 Git："
        echo "macOS: brew install git"
        echo "Ubuntu: sudo apt install git"
        echo "Windows: 下载 https://git-scm.com/"
        exit 1
    fi
    print_success "Git 已安装"
}

# 检查是否在 Git 仓库中
check_git_repo() {
    if [ -d ".git" ]; then
        print_warning "检测到现有 Git 仓库"
        read -p "是否继续？这可能会覆盖现有配置 (y/N): " continue_setup
        if [[ ! $continue_setup =~ ^[Yy]$ ]]; then
            echo "操作已取消"
            exit 0
        fi
    fi
}

# 获取用户信息
get_user_info() {
    echo ""
    print_info "步骤 1: 获取 GitHub 信息"
    echo "================================"
    
    # 获取 GitHub 用户名
    while true; do
        read -p "请输入你的 GitHub 用户名: " GITHUB_USERNAME
        if [ -z "$GITHUB_USERNAME" ]; then
            print_error "用户名不能为空，请重新输入"
        else
            break
        fi
    done
    
    # 获取仓库名
    echo ""
    echo "仓库命名建议："
    echo "1. 使用 '${GITHUB_USERNAME}.github.io' 获得简洁网址"
    echo "2. 使用其他名称，网址会是 'https://${GITHUB_USERNAME}.github.io/仓库名'"
    echo ""
    
    while true; do
        read -p "请输入仓库名 (建议: ${GITHUB_USERNAME}.github.io): " REPO_NAME
        if [ -z "$REPO_NAME" ]; then
            print_error "仓库名不能为空，请重新输入"
        else
            break
        fi
    done
    
    # 获取用户邮箱
    read -p "请输入你的邮箱 (用于 Git 配置): " USER_EMAIL
    if [ -z "$USER_EMAIL" ]; then
        USER_EMAIL="${GITHUB_USERNAME}@users.noreply.github.com"
        print_warning "使用默认邮箱: $USER_EMAIL"
    fi
    
    # 获取用户名
    read -p "请输入你的姓名 (用于 Git 配置): " USER_NAME
    if [ -z "$USER_NAME" ]; then
        USER_NAME="$GITHUB_USERNAME"
        print_warning "使用用户名作为姓名: $USER_NAME"
    fi
}

# 配置 Git
setup_git() {
    echo ""
    print_info "步骤 2: 配置 Git"
    echo "===================="
    
    git config user.name "$USER_NAME"
    git config user.email "$USER_EMAIL"
    print_success "Git 用户信息已配置"
}

# 初始化 Git 仓库
init_git_repo() {
    echo ""
    print_info "步骤 3: 初始化 Git 仓库"
    echo "============================"
    
    if [ ! -d ".git" ]; then
        git init
        print_success "Git 仓库已初始化"
    else
        print_success "Git 仓库已存在"
    fi
}

# 自定义网站内容
customize_website() {
    echo ""
    print_info "步骤 4: 自定义网站内容"
    echo "=========================="
    
    read -p "请输入网站标题 (默认: 我的个人网站): " SITE_TITLE
    if [ -z "$SITE_TITLE" ]; then
        SITE_TITLE="我的个人网站"
    fi
    
    read -p "请输入你的姓名 (默认: $USER_NAME): " SITE_NAME
    if [ -z "$SITE_NAME" ]; then
        SITE_NAME="$USER_NAME"
    fi
    
    read -p "请输入联系邮箱 (默认: $USER_EMAIL): " CONTACT_EMAIL
    if [ -z "$CONTACT_EMAIL" ]; then
        CONTACT_EMAIL="$USER_EMAIL"
    fi
    
    read -p "请输入 GitHub 链接 (默认: https://github.com/$GITHUB_USERNAME): " GITHUB_LINK
    if [ -z "$GITHUB_LINK" ]; then
        GITHUB_LINK="https://github.com/$GITHUB_USERNAME"
    fi
    
    # 更新网站内容
    update_website_content
}

# 更新网站内容
update_website_content() {
    print_info "正在更新网站内容..."
    
    # 更新 index.html
    sed -i.bak "s/我的个人网站/$SITE_TITLE/g" index.html
    sed -i.bak "s/我的网站/$SITE_TITLE/g" index.html
    sed -i.bak "s/your-email@example.com/$CONTACT_EMAIL/g" index.html
    sed -i.bak "s|https://github.com|$GITHUB_LINK|g" index.html
    
    # 更新 README.md
    sed -i.bak "s/YOUR_USERNAME/$GITHUB_USERNAME/g" README.md
    sed -i.bak "s/REPO_NAME/$REPO_NAME/g" README.md
    
    # 更新 deploy.sh
    sed -i.bak "s/YOUR_USERNAME/$GITHUB_USERNAME/g" deploy.sh
    sed -i.bak "s/YOUR_REPO_NAME/$REPO_NAME/g" deploy.sh
    
    # 清理备份文件
    rm -f *.bak
    
    print_success "网站内容已更新"
}

# 提交并推送代码
commit_and_push() {
    echo ""
    print_info "步骤 5: 提交并推送代码"
    echo "========================"
    
    # 添加所有文件
    git add .
    print_success "文件已添加到暂存区"
    
    # 提交更改
    git commit -m "Initial commit: $SITE_TITLE"
    print_success "更改已提交"
    
    # 添加远程仓库
    git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git" 2>/dev/null || {
        print_warning "远程仓库已存在，正在更新..."
        git remote set-url origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    }
    print_success "远程仓库已配置"
    
    # 推送到 GitHub
    print_info "正在推送到 GitHub..."
    git branch -M main
    git push -u origin main
    
    if [ $? -eq 0 ]; then
        print_success "代码已成功推送到 GitHub"
    else
        print_error "推送失败！请检查："
        echo "1. 仓库是否已在 GitHub 上创建"
        echo "2. 网络连接是否正常"
        echo "3. GitHub 凭据是否正确"
        exit 1
    fi
}

# 显示后续步骤
show_next_steps() {
    echo ""
    print_success "🎉 部署完成！"
    echo "==============="
    echo ""
    print_info "接下来需要手动完成的步骤："
    echo ""
    echo "1. 在 GitHub 上启用 Pages："
    echo "   - 访问: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo "   - 点击 'Settings'"
    echo "   - 左侧菜单点击 'Pages'"
    echo "   - Source 选择 'Deploy from a branch'"
    echo "   - Branch 选择 'main'"
    echo "   - Folder 选择 '/ (root)'"
    echo "   - 点击 'Save'"
    echo ""
    echo "2. 等待 1-2 分钟，然后访问你的网站："
    if [[ "$REPO_NAME" == "$GITHUB_USERNAME.github.io" ]]; then
        echo "   🌐 https://$GITHUB_USERNAME.github.io"
    else
        echo "   🌐 https://$GITHUB_USERNAME.github.io/$REPO_NAME"
    fi
    echo ""
    print_info "网站文件位置："
    echo "   - 主页: index.html"
    echo "   - 样式: styles/style.css"
    echo "   - 脚本: scripts/main.js"
    echo ""
    print_info "更新网站："
    echo "   修改文件后运行: ./deploy.sh"
    echo ""
}

# 主函数
main() {
    echo "欢迎使用 GitHub Pages 自动部署工具！"
    echo "这个工具将帮你："
    echo "1. 配置 Git"
    echo "2. 自定义网站内容"
    echo "3. 自动推送到 GitHub"
    echo ""
    
    # 检查前置条件
    check_git
    check_git_repo
    
    # 获取用户信息
    get_user_info
    
    # 配置 Git
    setup_git
    
    # 初始化仓库
    init_git_repo
    
    # 自定义网站
    customize_website
    
    # 提交推送
    commit_and_push
    
    # 显示后续步骤
    show_next_steps
}

# 运行主函数
main
