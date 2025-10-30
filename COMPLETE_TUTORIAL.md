# 🎯 完整部署教程 - 一步一步教你部署网站

## 📝 概览

你需要完成 3 个主要步骤：
1. ✅ 在 GitHub 创建仓库（5分钟）
2. ✅ 配置 GitHub 认证（10分钟）
3. ✅ 运行脚本部署（2分钟）

---

## 🔴 步骤 1: 在 GitHub 创建仓库

### 1.1 打开浏览器
访问：https://github.com/new

### 1.2 填写仓库信息

在页面上你会看到：

```
Repository name: [输入框]
```

**在输入框中填写**：
```
chuhanzhang.github.io
```

### 1.3 选择可见性

你会看到两个选项：
- ⚪ Private（私有）
- 🔵 **Public（公开）** ← **选择这个！**

**选择 Public**（GitHub Pages 免费功能需要公开仓库）

### 1.4 重要：不要勾选这些选项！

页面上有三个复选框：
```
☐ Add a README file        ← 不要勾选
☐ Add .gitignore           ← 不要勾选
☐ Choose a license         ← 不要勾选
```

**让所有复选框保持空白！**

### 1.5 创建仓库

点击页面底部的绿色按钮：
```
[Create repository]
```

### 1.6 确认

创建成功后，你会看到一个页面显示：
```
Quick setup — if you've done this kind of thing before
```

**看到这个页面就成功了！** 现在可以进行下一步。

---

## 🔐 步骤 2: 配置 GitHub 认证（选择一种方法）

GitHub 需要验证你的身份才能推送代码。有两种方法，**推荐方法 A（更简单）**。

### 方法 A: 使用 Token（推荐，5分钟）

#### 2.1 生成 Token

1. 访问：https://github.com/settings/tokens/new

2. 你会看到一个表单，填写：

   **Note（备注）**：
   ```
   Website Deployment
   ```
   
   **Expiration（有效期）**：在下拉菜单中选择
   ```
   90 days
   ```
   （或更长时间）

3. 滚动到 **Select scopes** 部分

4. 找到 **repo**，点击左侧的复选框：
   ```
   ☑️ repo
   ```
   
   点击后会展开很多选项，**它们会自动全部选中**，这样就可以了。

5. 滚动到页面最底部，点击：
   ```
   [Generate token] （绿色按钮）
   ```

#### 2.2 复制并保存 Token

Token 生成后，会显示一长串字符，类似：
```
ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

**⚠️ 重要：这个 Token 只显示一次！**

1. **立即复制**这串字符（全选 → Cmd+C）
2. **粘贴到备忘录**或文本文件保存起来
3. 给它起个标题，比如："GitHub Token for chuhanzhang.github.io"

#### 2.3 配置 Git

在终端运行：
```bash
git config --global credential.helper osxkeychain
```

运行后应该没有任何错误提示。

---

### 方法 B: 使用 SSH 密钥（10分钟，更安全）

#### 2.1 生成 SSH 密钥

在终端运行：
```bash
ssh-keygen -t ed25519 -C "da7acc2ch@outlook.com"
```

你会看到：
```
Generating public/private ed25519 key pair.
Enter file in which to save the key (/Users/daniel/.ssh/id_ed25519): 
```

**直接按 Enter 键**（接受默认位置）

然后会提示：
```
Enter passphrase (empty for no passphrase): 
```

**直接按 Enter 键**（不设置密码）

再次按 Enter 确认

最后会显示：
```
Your public key has been saved in...
```

#### 2.2 复制公钥

运行：
```bash
cat ~/.ssh/id_ed25519.pub
```

会显示一长串字符，类似：
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAA... da7acc2ch@outlook.com
```

**全选并复制**这整行（Cmd+A 然后 Cmd+C）

#### 2.3 添加到 GitHub

1. 访问：https://github.com/settings/keys

2. 点击：
   ```
   [New SSH key]
   ```

3. 填写表单：

   **Title**：
   ```
   My MacBook
   ```

   **Key**：
   粘贴刚才复制的整个公钥

4. 点击：
   ```
   [Add SSH key]
   ```

#### 2.4 修改远程仓库地址

在终端运行：
```bash
git remote set-url origin git@github.com:da7acc2ch/chuhanzhang.github.io.git
```

---

## 🚀 步骤 3: 运行脚本部署

### 3.1 运行脚本

在终端运行：
```bash
./setup-website.sh
```

### 3.2 如果你选择方法 A (Token)

当脚本提示推送到 GitHub 时，会要求输入：
```
Username: 
```
**输入**：`da7acc2ch`

```
Password: 
```
**输入**：粘贴你保存的 Token（不是你的 GitHub 密码！）

然后按 Enter。

### 3.3 如果你选择方法 B (SSH)

如果首次使用，会提示：
```
The authenticity of host 'github.com' can't be established...
Are you sure you want to continue connecting (yes/no)? 
```

**输入**：`yes`

然后按 Enter。

---

## ✅ 步骤 4: 确认部署成功

如果看到：
```
✅ 代码已成功推送到 GitHub
🎉 部署完成！
```

**恭喜！代码已推送到 GitHub！**

---

## 🌐 步骤 5: 启用 GitHub Pages

### 5.1 打开仓库设置

1. 访问：https://github.com/da7acc2ch/chuhanzhang.github.io

2. 点击顶部的：
   ```
   Settings （选项卡）
   ```

### 5.2 进入 Pages 设置

在左侧菜单中，找到并点击：
```
Pages
```

### 5.3 配置部署源

向下滚动到 **Build and deployment** 部分

你会看到：
```
Source
[None ▼]
```

点击下拉菜单，选择：
```
[Deploy from a branch]
```

然后下方会出现更多选项：
```
Branch: [main ▼]          ← 选择 "main"
/ (root)                   ← 选择 "/ (root)"
```

### 5.4 保存

滚动到底部，点击：
```
[Save] （绿色按钮）
```

### 5.5 等待部署

页面会显示：
```
Your site is live at https://chuhanzhang.github.io/
```

**等待 1-2 分钟**，然后访问这个网址。

---

## 🎉 完成！

现在你的网站应该在以下地址上线：
```
https://chuhanzhang.github.io/
```

---

## 🆘 常见问题

### Q1: "Repository not found"
**原因**：仓库还未创建或名字不对
**解决**：完成步骤 1，确保仓库名是 `chuhanzhang.github.io`

### Q2: "Authentication failed"
**原因**：未配置认证
**解决**：完成步骤 2，方法 A 或 B

### Q3: Token 输入后仍然失败
**原因**：Token 过期或权限不足
**解决**：重新生成 Token，确保勾选了 `repo` 权限

### Q4: 启用 Pages 后网站打不开
**原因**：还在部署中
**解决**：等待 2-5 分钟，刷新页面

### Q5: 网站显示 404
**原因**：文件不在根目录
**解决**：确保 `index.html` 在仓库根目录

---

## 📞 需要帮助？

如果遇到任何问题，请告诉我：
1. 你在哪个步骤
2. 错误信息是什么
3. 你使用了哪种认证方法

我会继续帮助你！

