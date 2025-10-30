# GitHub Pages 网站

这是一个简单的 GitHub Pages 网站项目。

## 🚀 快速开始

### 1. 在 GitHub 上创建仓库

1. 访问 [GitHub](https://github.com) 并登录
2. 点击右上角的 "+" 按钮，选择 "New repository"
3. 为仓库命名（例如：`my-website` 或 `your-username.github.io`）
4. 如果使用 `your-username.github.io` 格式，网站会自动部署到 `https://your-username.github.io`
5. 选择 "Public"（免费帐户只能使用 Public 仓库）
6. **不要**初始化 README、.gitignore 或 license
7. 点击 "Create repository"

### 2. 初始化 Git 并推送代码

在项目目录中运行以下命令：

```bash
# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交更改
git commit -m "Initial commit: my website"

# 添加远程仓库（替换 YOUR_USERNAME 和 REPO_NAME）
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# 重命名分支为 main（如果需要）
git branch -M main

# 推送到 GitHub
git push -u origin main
```

### 3. 启用 GitHub Pages

1. 在 GitHub 仓库页面，点击 "Settings"（设置）
2. 在左侧菜单中，找到并点击 "Pages"
3. 在 "Source" 部分，选择 "Deploy from a branch"
4. 选择分支为 "main"
5. 选择文件夹为 "/ (root)" 或 "/docs"（如果你的网站文件在 docs 文件夹中）
6. 点击 "Save"
7. 等待几分钟后，你的网站将在 `https://YOUR_USERNAME.github.io/REPO_NAME` 上线

## 📝 自定义网站

- 编辑 `index.html` 修改主页内容
- 在 `styles/` 文件夹中修改样式
- 在 `scripts/` 文件夹中添加 JavaScript 功能
- 添加更多页面只需创建新的 HTML 文件

## 🌟 功能特点

- ✅ 响应式设计
- ✅ 现代化 UI
- ✅ 易于自定义
- ✅ 免费托管

## 📧 联系

如有问题，欢迎通过 GitHub Issues 联系。

