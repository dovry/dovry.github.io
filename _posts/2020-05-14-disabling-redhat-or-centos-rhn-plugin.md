---
# docs - https://jekyllrb.com/docs/posts/
layout:       default
author:       dovry
title:        "Disabling RedHat or CentOS RHN plugin"
description:  "Disable the annoying message about the RH/CentOS system not being in RedHat Satellite"
date:         2020-05-14 22:56:47 +0200
# header-img:       # used with simpol-theme
categories: [linux,redhat,centos,tips/tricks]    # comma seperated
tags: [linux,redhat,centos,tips/tricks]          # comma seperated
---

While I was patching a customer's RedHat/CentOS servers, I encountered a message about the systems not being registered to Red Hat Subscription management, which is correct, since that customer did not want their servers in our Satellite.

# Issue

RHN Classic

```sh
This system is not registered to Red Hat Subscription Management. You can use subscription-manager to register.
This system is receiving updates from RHN Classic or RHN Satellite.
```

Subscription management

```sh
This system is not registered with RHN Classic or RHN Satellite.
You can use rhn_register to register.
RHN Satellite or RHN Classic support will be disabled.
```

RHEL/CentOS 7

```sh
This system is not registered with an entitlement server. You can use subscription-manager to register.
```

RHEL/CentOS 8

```sh
This system is not registered to Red Hat Subscription Management. You can use subscription-manager to register.
```

# How to fix it

Run these four commands with elevated privileges.

```sh
sed -i.bak 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/rhnplugin.conf

sed -i.bak 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/subscription-manager.conf

chkconfig rhsmcertd off

service rhsmcertd stop
```

You can verify that the files were changed by running `grep -e "enabled" <filename>`. The result should only return `enabled=0`

# Command breakdown

First, we tell `sed` that we want to edit a file in-place, with the `'-i / --in-place'` argument, and create a backup. In-place meaning live, like opening it in a text editor.

```sh
sed -i.bak
```

We then specify that we want to use regexp searching with `'s/'`, which string we want to target (`'enabled = 1'`), what to replace that string with (`'enabled = 0'`), and finally, that we want to change all instances of `'enabled = 1'` by specifying `'/g'`, meaning **globally**.

```sh
's/enabled=1/enabled=0/g'
```

...and...

```sh
's/enabled=1/enabled=0/g'
```

...respectively. 

The final portion of the `sed` command specifies which file to edit.

`/etc/yum/pluginconf.d/rhnplugin.conf`

`/etc/yum/pluginconf.d/subscription-manager.conf`

> What about `chkconfig` and `service stop` ?

Well, `chkconfig <service> off` stops the service

While `service <service> stop` does the same, but stops the init script

# Final words

I can now run `yum update` without the systems mentioning that it's not a member of the Satellite system anymore, which is correct, and leaves less clutter in the terminal.