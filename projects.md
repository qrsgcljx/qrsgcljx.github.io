---
layout: default
title: 项目
---

<div class="container">
    <h2>项目案例</h2>
    
    <div class="projects-list">
        {% for project in site.projects %}
        <article class="project-item">
            <h3><a href="{{ project.url | prepend: site.baseurl }}">{{ project.title }}</a></h3>
            <p>{{ project.excerpt | strip_html | truncate: 100 }}</p>
            <a href="{{ project.url | prepend: site.baseurl }}" class="view-project">查看项目</a>
        </article>
        {% endfor %}
    </div>
</div>