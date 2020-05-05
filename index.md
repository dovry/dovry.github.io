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

<div class="wrap">

 {% for post in paginator.posts %}
  {% if post.skip_from_archives != true %}

  <article class="blog-post">

  <div class="blog-post__header">
   <h2 class="blog-post__title"><a href="{{ post.url }}">{{ post.title }}</a></h2>
   <p class="blog-post__subtitle">{{ post.date | date_to_long_string }}</p>
  </div>

  {% if post.featured_image %}
  <a href="{{ post.url }}" class="blog-post__image" style="background-image: url({{ post.featured_image  }});"></a>
  {% endif %}

  <div class="blog-post__content">
   <p>{{ post.excerpt }}</p>
   <p><a href="{{ post.url }}" class="button">Read More</a>
  </div>

  </article>
  {% endif %}
 {% endfor %}

</div>
