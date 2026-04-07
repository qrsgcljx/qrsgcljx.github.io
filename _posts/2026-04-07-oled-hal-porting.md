---
title: 江科大OLED代码移植至HAL库
date: 2026-04-07
author: 嵌入式开发者
tags: [STM32, OLED, HAL库, 代码移植]
excerpt: 本文介绍如何将江科大的OLED代码移植到STM32 HAL库环境中，实现OLED显示屏的驱动。
---

# 江科大OLED代码移植至HAL库

<div class="card-info">
  <div class="card-content">
    <p>😊 基于江科大oled代码移植，不改变引脚。需自备江科大代码，以下部分可点击展开。</p>
    <p>注意：</p>
    <p>方法1：进入我的github直接使用我的工程</p>
    <p>方法2：进入github打开我的文件，按照教程复制粘贴</p>
    <p>方法3：按照教程更改代码</p>
    <p>如果初次使用vscode+HAL库，无论使用哪种方法推荐看一遍教程，会有所收获</p>
  </div>
</div>

## 为什么需要移植？

江科大的OLED代码通常是基于标准库编写的，而现代STM32开发更推荐使用HAL库，因为HAL库提供了更好的可移植性和易用性。本文将详细介绍如何将江科大的OLED代码移植到HAL库环境中。
