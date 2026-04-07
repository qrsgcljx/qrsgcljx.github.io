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

## CubMX配置

<div class="collapsible-section">
  <div class="collapsible-header">
    <span>基础设置</span>
    <button class="collapsible-btn">▼</button>
  </div>
  <div class="collapsible-content">
    <p>基础设置包括项目创建、时钟配置等步骤。</p>
    <ol>
      <li>打开STM32CubeMX，选择对应的STM32型号</li>
      <p><img src="/assets/img/begain.png" alt="选择芯片" style="max-width: 100%; height: auto;"></p>
      <li>配置RCC时钟</li>
      <p><img src="/assets/img/rcc.png" alt="配置rcc时钟" style="max-width: 100%; height: auto;"></p>
      <li>配置时钟为72HZ</li>
      <p><img src="/assets/img/timer.png" alt="配置时钟" style="max-width: 100%; height: auto;"></p>
    </ol>
  </div>
</div>

<div class="collapsible-section">
  <div class="collapsible-header">
    <span>I2C模式设置</span>
    <button class="collapsible-btn">▼</button>
  </div>
  <div class="collapsible-content">
    <p>配置I2C接口用于与OLED通信。</p>
    <ol>
      <li>在Pinout & Configuration中找到I2C1</li>
      <p><img src="/assets/img/IIC.png" alt="I2C配置" style="max-width: 100%; height: auto;"></p>
      <li>选择I2C模式，设置通信速度为100kHz</li>
      <li>配置对应的SDA和SCL引脚</li>
    </ol>
  </div>
</div>

<div class="collapsible-section">
  <div class="collapsible-header">
    <span>软件代码设置</span>
    <button class="collapsible-btn">▼</button>
  </div>
  <div class="collapsible-content">
    <p>生成代码并配置项目设置。</p>
    <ol>
      <li>在Project Manager中设置项目名称和路径</li>
      <li>选择Toolchain/IDE为STM32CubeIDE或其他IDE</li>
      <li>生成代码</li>
    </ol>
  </div>
</div>

<div class="collapsible-section">
  <div class="collapsible-header">
    <span>最后一步也是最关键的一步配置文件路径</span>
    <button class="collapsible-btn">▼</button>
  </div>
  <div class="collapsible-content">
    <p>确保代码能够正确编译和运行。</p>
    <ol>
      <li>检查生成的代码结构</li>
      <li>添加OLED驱动文件到项目中</li>
      <li>配置包含文件路径</li>
      <li>编译并测试</li>
    </ol>
  </div>
</div>

## 为什么需要移植？
