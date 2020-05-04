---
# docs - https://jekyllrb.com/docs/posts/
layout: post
author: dovry
title:  "Automatically creating blogposts with a bash script"
date:   2020-05-05 00:23:36 +0200
# comments_id:
categories: [automation, shell, bash, script] # comma seperated
tags: [automation, shell, bash, script] # comma seperated
---

I couldn't find a quick-and-easy method to quickly generate a template post file for Jekyll, so I scripted it.

{% include new_post.sh %}

Here is the sample output when creating a new blogpost

{% highlight sh %}
dovry@wsl$ ./_includes/new_post.sh "Sample Jekyll blog post"

A new post with the title

  2020-05-05-sample-jekyll-blog-post.md

created in _posts/
{% endhighlight %}

The script creates a blog post and all additional folders I might want to use.

![Screenshot](/assets/article_images/2020-05-05-sample-jekyll-blog-post/script_example.png)