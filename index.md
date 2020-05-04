---
layout: default
title: "Index"
permalink: /index
---

<!-- List of posts in _posts -->
## Articles

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
