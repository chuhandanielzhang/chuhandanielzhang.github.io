# 快速入门指南 🚀

## 步骤 1: 在 GitHub 创建仓库

1. 访问 https://github.com 并登录
2. 点击右上角 ➕ 按钮，选择 "New repository"
3. 输入仓库名，例如：
   - `my-website` (常规仓库)
   - `your-username.github.io` (自动域名)
4. 选择 **Public**
5. **不要**勾选任何初始化选项
6. 点击 "Create repository"

## 步骤 2: 配置并部署

### 方法 A: 使用自动化脚本

1. 编辑 `deploy.sh` 文件，修改以下两行：
   ```bash
   GITHUB_USERNAME="你的用户名"
   REPO_NAME="你的仓库名"
   ```

2. 运行脚本：
   ```bash
   ./deploy.sh
   ```

### 方法 B: 手动操作

```bash
# 1. 初始化 Git（如果还没有）
git init

# 2. 添加所有文件
git add .

# 3. 提交
git commit -m "Initial commit: my website"

# 4. 添加远程仓库（替换为你的用户名和仓库名）
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# 5. 推送到 GitHub
git branch -M main
git push -u origin main
```

## 步骤 3: 启用 GitHub Pages

1. 在 GitHub 仓库页面，点击 **Settings**
2. 左侧菜单找到并点击 **Pages**
3. 在 "Source" 选择：
   - Branch: **main**
   - Folder: **/ (root)**
4. 点击 **Save**
5. 等待 1-2 分钟，网站即可访问

## 步骤 4: 访问你的网站

- 如果你的仓库名是 `your-username.github.io`:
  - 网址：`https://your-username.github.io`

- 如果你的仓库名是其他名称:
  - 网址：`https://your-username.github.io/repo-name`

## 📝 自定义网站

### 修改内容

编辑 `index.html` 文件：
- 修改标题、文字、项目描述等

### 修改样式

编辑 `styles/style.css` 文件：
- 修改颜色（在 `:root` 部分）
- 调整字体、间距等

### 修改功能

编辑 `scripts/main.js` 文件：
- 添加交互功能
- 自定义行为

### 添加新页面

1. 创建新的 HTML 文件，例如 `about.html`
2. 复制 `index.html` 的结构
3. 修改内容
4. 在导航菜单中添加链接

## 🔄 更新网站

每次修改后，运行：

```bash
git add .
git commit -m "Update website content"
git push
```

网站会在几分钟内自动更新！

## 🎨 建议的自定义内容

在部署前，记得修改：

1. **index.html**:
   - 联系邮箱（第 64 行）
   - 社交媒体链接（第 65 行）
   - 网站标题和个人信息

2. **styles/style.css**:
   - 修改 `--primary-color` 等颜色变量
   - 调整字体和间距

## 💡 小贴士

- 使用 `your-username.github.io` 作为仓库名可以获得更简洁的网址
- GitHub Pages 是免费的，但仓库必须是 Public
- 网站支持自定义域名（在 Pages 设置中配置）
- 可以使用 Jekyll、Hugo 等静态网站生成器（可选）

## ❓ 遇到问题？

查看 [README.md](README.md) 获取更多详细信息。

祝你网站部署顺利！🎉

