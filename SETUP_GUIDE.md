# 🔧 部署前准备指南

## ⚠️ 重要：完成以下步骤才能继续部署

### 步骤 1: 在 GitHub 创建仓库

1. 访问 https://github.com/new
2. 输入仓库名：`chuhanzhang.github.io`（必须与你的设置一致）
3. **必须选择 Public**（免费帐户）
4. **不要**勾选任何选项：
   - ❌ 不要勾选 "Add a README file"
   - ❌ 不要勾选 "Add .gitignore"
   - ❌ 不要勾选 "Choose a license"
5. 点击 "Create repository"

### 步骤 2: 配置 GitHub 认证

选择以下两种方法之一：

#### 方法 A: 使用 Personal Access Token (推荐)

1. 访问 https://github.com/settings/tokens/new
2. 填写 Token 信息：
   - Note: "Website Deployment"
   - Expiration: 选择 "90 days" 或更长
   - 勾选权限：`repo` 下的所有选项
3. 点击 "Generate token"
4. **复制并保存这个 token**（只显示一次！）

然后在终端运行：
```bash
git config --global credential.helper osxkeychain
```

推送时会提示输入用户名和密码，密码填刚才复制的 token。

#### 方法 B: 使用 SSH 密钥

在终端运行以下命令生成 SSH 密钥：

```bash
ssh-keygen -t ed25519 -C "da7acc2ch@outlook.com"
```

按 Enter 接受默认设置。

然后复制公钥：
```bash
cat ~/.ssh/id_ed25519.pub
```

1. 复制整个输出
2. 访问 https://github.com/settings/keys
3. 点击 "New SSH key"
4. 粘贴密钥，点击 "Add SSH key"

然后修改远程仓库地址：
```bash
git remote set-url origin git@github.com:da7acc2ch/chuhanzhang.github.io.git
```

### 步骤 3: 重新运行部署

完成上述步骤后，运行：

```bash
./setup-website.sh
```

或者直接推送：

```bash
git push -u origin main
```

---

## 📧 需要帮助？

如果遇到问题，请检查：
- [ ] 仓库是否已创建
- [ ] 仓库是否设置为 Public
- [ ] 是否配置了正确的认证方式
- [ ] 网络连接是否正常

