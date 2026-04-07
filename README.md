# 嵌入式开发者博客（新手模式）

这是一个基于 Jekyll 的 GitHub Pages 博客，已经加入“新手模式”脚本。

你现在只需要记住：

1. 新建文章：双击 `scripts/new-post.bat`
2. 写文章内容：编辑 `_posts` 里新生成的 Markdown 文件
3. 发布网站：双击 `scripts/publish.bat`
4. 强制重新发布（无改动也触发构建）：双击 `scripts/force-publish.bat`

---

## 你要先安装什么

### 1) Git（必须）

- 下载并安装 Git: [https://git-scm.com/download/win](https://git-scm.com/download/win)
- 安装后重启终端

### 2) （可选）本地预览环境

如果你想在本地看效果，再安装 Ruby + Jekyll：

```powershell
gem install jekyll bundler
bundle install
```

本地预览命令：

```powershell
bundle exec jekyll serve
```

浏览器打开 `http://localhost:4000`

---

## 日常发布流程（最简）

### 第一步：新建文章文件

双击运行：

`scripts/new-post.bat`

脚本会让你输入：

- 标题
- 标签（可空，英文逗号分隔）
- 摘要（可空）
- 作者（可空，默认“嵌入式开发者”）

然后自动在 `_posts` 下生成形如 `YYYY-MM-DD-english-slug.md` 的文件。

### 第二步：写内容

打开刚生成的文件，直接写 Markdown 正文。

### 第三步：一键发布

双击 `scripts/publish.bat`（或在终端运行同名命令）。

它会自动执行：

- `git add .`
- `git commit -m "..."`
- `git push origin main`

推送后等待 GitHub Pages 构建，一般 1-3 分钟生效。

### 需要“重新发送/强制重建”时

双击 `scripts/force-publish.bat`。

说明：

- 如果有改动：正常提交并推送
- 如果没改动：会创建一个空提交并推送，用于强制触发 GitHub Pages 重建

---

## 常见问题

### 1) 双击 `publish.bat` 报错

先确认：

- 已安装 Git
- 你已完成 `git clone`，并且仓库目录正确
- 你已经登录或配置好 GitHub 凭据

### 2) 没有变化可提交

脚本会提示“没有检测到变更”，属于正常现象，说明你还没改文件。

### 3) 发布到了错误分支

请把 `scripts/publish.ps1` 里的 `$Branch` 改成你的发布分支（默认是 `main`）。

---

## 目录说明（新手重点）

- `_posts/`：博客文章（你最常编辑）
- `_projects/`：项目展示
- `scripts/new-post.ps1`：新建文章脚本
- `scripts/new-post.bat`：双击新建文章入口
- `scripts/publish.ps1`：一键发布脚本
- `scripts/publish.bat`：双击入口
- `scripts/force-publish.ps1`：强制发布脚本
- `scripts/force-publish.bat`：双击强制发布入口
- `templates/post-template.md`：文章模板

---

## 许可证

本项目采用 MIT 许可证。
