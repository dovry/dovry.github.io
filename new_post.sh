#!/bin/bash
# how to use this script
# ./new_post.sh "Post Title Here"

# converts input with uppercase to lower case, and spaces to dashes
# ./string_manip.sh "Example FIle name With CAPITAL LetterS"
# 2022-09-15-example-file-name-with-capital-leters
post_title=$(date +%F)-"$(tr -s '[:upper:] ' '[:lower:]-' <<< "$1")"

# Make sure post title is included in run command
[[ -z $1 ]] && printf "\nA post title is required!\n\n" && exit 1
# Make sure the post title is quoted if it contains more than one word
[[ -n $2 ]] && printf "\nUse double quotes around your title!\n\n" && exit 1
# Check for homonymous posts
[[ -f _posts/"$post_title".md || -d assets/article_images/"$post_title" ]] \
&& printf "\nA file with that name already exists!\n\n" && exit 1

cat << EOT >> _posts/"$post_title".md
---
# docs - https://jekyllrb.com/docs/posts/
layout:       default
author:       $(whoami)
title:        "$1"
description:  ""
date:         $(date "+%F %X %z")
# header-img:       # used with simpol-theme
# categories: []    # comma seperated
# tags: []          # comma seperated
---
EOT

# Create any missing files/folders associated with the post
mkdir --parent assets/article_images/"$post_title"

printf "\nA new post with the title \n\n  %s.md \n\ncreated in _posts/\n\n" "$post_title"
