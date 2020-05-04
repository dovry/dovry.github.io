---
# docs - https://jekyllrb.com/docs/posts/
layout: post
title:  "Verbose logging in Molecule"
date:   2020-05-04 21:42:14 +0200
# comments_id:
categories: [ansible, molecule, automation]
tags: [ansible, molecule, automation]
---

If you've ever encountered this frustrating message when you're debugging your Ansible roles with Molecule

{% highlight yaml %}
TASK [somerole : sometask] **************
failed: [localhost] (item=None) => {"attempts": 1, "censored": "the output has been hidden due to the fact that 'no_log: true' was specified for this result", "changed": false}
{% endhighlight %}

The solution is to add

{% highlight yaml %}
log: true
{% endhighlight %}

under the 'provisioner' in molecule/default/molecule.yml, like so
{% highlight yaml %}
provisioner:
    name: ansible
    log: true
{% endhighlight %}