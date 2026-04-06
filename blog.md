---
layout: default
title: 博客
---

<div class="container">
    <h2>博客文章</h2>
    
    <div class="posts-list">
        {% for post in site.posts %}
        <article class="post-item">
            <h3><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></h3>
            <p class="post-meta">{{ post.date | date: "%Y年%m月%d日" }}</p>
            <p>{{ post.excerpt | strip_html | truncate: 150 }}</p>
            <a href="{{ post.url | prepend: site.baseurl }}" class="read-more">阅读更多</a>
        </article>
        {% endfor %}
    </div>
    
    {% if paginator.total_pages > 1 %}
    <div class="pagination">
        {% if paginator.previous_page %}
        <a href="{{ paginator.previous_page_path }}" class="prev">上一页</a>
        {% endif %}
        
        <span class="page-number">第 {{ paginator.page }} 页，共 {{ paginator.total_pages }} 页</span>
        
        {% if paginator.next_page %}
        <a href="{{ paginator.next_page_path }}" class="next">下一页</a>
        {% endif %}
    </div>
    {% endif %}
</div>