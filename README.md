# 嵌入式开发者博客

这是一个基于Jekyll的个人博客，专为嵌入式系统开发者设计。

## 功能特性

- 响应式设计，适配不同设备
- 支持博客文章和项目展示
- 简洁美观的界面
- 易于维护和扩展

## 技术栈

- Jekyll：静态网站生成器
- HTML5/CSS3：页面结构和样式
- JavaScript：交互功能
- Git：版本控制
- GitHub Pages：部署平台

## 本地开发

1. 安装Jekyll和相关依赖：
   ```bash
   gem install jekyll bundler
   ```

2. 克隆仓库：
   ```bash
   git clone https://github.com/qrsgcljx/qrsgcljx.github.io.git
   cd qrsgcljx.github.io
   ```

3. 安装依赖：
   ```bash
   bundle install
   ```

4. 启动本地服务器：
   ```bash
   bundle exec jekyll serve
   ```

5. 访问 http://localhost:4000 查看博客

## 部署到GitHub Pages

1. 确保你的仓库名为 `username.github.io`，其中 `username` 是你的GitHub用户名

2. 提交所有更改：
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

3. 等待GitHub Pages构建完成，通常需要几分钟时间

4. 访问 https://username.github.io 查看你的博客

## 如何添加内容

### 添加博客文章

在 `_posts` 目录下创建新的Markdown文件，文件名格式为 `YYYY-MM-DD-title.md`，例如：

```markdown
---
title: 文章标题
date: 2026-04-06
author: 作者名
tags: [标签1, 标签2]
excerpt: 文章摘要
---

# 文章内容
...
```

### 添加项目

在 `_projects` 目录下创建新的Markdown文件，例如：

```markdown
---
title: 项目标题
date: 2026-04-06
technologies:
  - 技术1
  - 技术2
excerpt: 项目摘要
links:
  - title: GitHub仓库
    url: https://github.com/username/project
---

# 项目内容
...
```

## 自定义配置

编辑 `_config.yml` 文件可以修改博客的基本设置，如标题、描述、导航菜单等。

## 主题自定义

- 修改 `assets/css/style.css` 文件可以自定义样式
- 修改 `_layouts` 目录下的文件可以自定义页面布局
- 修改 `_includes` 目录下的文件可以自定义页面组件

## 许可证

本项目采用 MIT 许可证。
