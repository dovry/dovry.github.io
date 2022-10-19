---
# docs - https://jekyllrb.com/docs/posts/
layout: default
author: dovry
title:  "Set up SSH for GitHub"
date:   2022-10-19 13:14:13 +0200
Description: "Directions to setup "
categories: [ssh, git, automation]
tags: [ssh, git, automation]
---

I hate having to look up how to configure ssh agents and keys every time

{% highlight bash %}
mkdir -p ~/.ssh && cd $_
ssh-keygen -t rsa
vim ~/.ssh/config
{% endhighlight %}

Paste this into `~/.ssh/config`, make sure to change the `IdentityFile key name`

{% highlight bash %}
  host github.com
   hostname github.com
   PreferredAuthentications publickey
   IdentityFile ~/.ssh/!!!SSH_KEYGEN_NAME!!!
{% endhighlight %}

upload generated PUBLIC key to github profile
`git pull` should now work

