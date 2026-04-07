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
    <p>本项目以vscode作为示例</p>
    <ol>
      <li>将PB8 PB9设置为I2C模式</li>
      <li>在打开的主文件夹内创建Hardware目录</li>
      <li>将.c 两个.h文件复制进去</li>
      <p><img src="/assets/img/IIC.png" alt="I2C配置" style="max-width: 100%; height: auto;"></p>
      <li>打开oled.c,将OLED_WriteData（）函数及前面更换</li>
      <li>下滑找到void OLED_Init(void)，将函数内OLED_I2C_Init();//端口初始化，这一句删除，oled.c文件完成</li>
      <li>进入oled.h文件更换代码，完成</li>
      <li>至此已经代码更改部分完成，但可能OLED_Font.h文件报错，可以将每个字对应的码使用{}包含即可。如图：</li>
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
      <li>找到主文件夹中CMakelist.txt打开</li>
      <li>在图示部分添加代码</li>
      <li>更改结束可以在主函数中添加代码进行测试</li>
    </ol>
  </div>
</div>

## 为什么需要移植？
