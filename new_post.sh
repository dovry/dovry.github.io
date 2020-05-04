#!/bin/bash
# how to use this script
# ./new_post.sh "Post Title Here"

title="$(sed 's/ /-/g' <<< "$(echo "$1" | tr '[:upper:]' '[:lower:]')")"
post_title=$(date +%F)-"$title"

# Make sure post title is included in run command
[[ -z $1 ]] && printf "\nA post title is required!\n\n" && exit 1
# Make sure the post title is quoted if it contains more than one word
[[ -n $2 ]] && printf "\nUse double quotes around your title!\n\n" && exit 1
# Check for homonymous posts
[[ -f _posts/"$post_title".md || -d _assets/article_images/"$post_title" ]] \
&& printf "\nA file with that name already exists!\n\n" && exit 1

cat << EOT >> _posts/"$post_title".md
---
# docs - https://jekyllrb.com/docs/posts/
layout: default
author: $(whoami)
title:  "$1"
date:   $(date "+%F %X %z")
# comments_id:      # issue number on github
# categories: []    # comma seperated
# tags: []          # comma seperated
---
EOT

# Create any missing files/folders associated with the post
mkdir --parent assets/article_images/"$post_title"

printf "\nA new post with the title \n\n  %s.md \n\ncreated in _posts/\n\n" "$post_title"