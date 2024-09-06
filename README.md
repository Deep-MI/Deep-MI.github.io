# zhulab-mind.github.io


## Create News Posts

- put an .md file into the _posts directory
- name it like 2020-03-15-Short-Title.md
- have it start with the following markdown
```
---
title: Your Nice Title
author: First Lastname
layout: post
group: news
---
Your text goes here, with images, links etc....
```

## Add Members

- add member info to _data/members.yml (see file for format)
- put photos (size 365 x 365, 72 dpi) into /static/img/members (jpg compressed)


## Add Publication

- add publication info to _data/publications.yml (see file for format)
- add teaser image (size height 200 px max, jpg compressed, max 100kB) into /static/pub/paper_id.jpg
- add bibtex file into /static/pub/paper_id.bib
- link to openaccess PDF (journal) or put at /static/pub/paper_id.pdf
- paper_id is the id field in the yml

## Sources

This website was built using the Fraser Lab [website](http://fraserlab.com/) as a template.  James Fraser's website is open-source and available on [Github](https://github.com/fraser-lab/fraser-lab.github.io)


Technologies this website uses:  

    Jekyll  
    Github Pages  
    Twitter Bootstrap 4.4.1

Before pushing changes, please check that they will work on your system first with the plugins included in the Gemfile using the bundler tool (results served at [0.0.0.0:4000](0.0.0.0:4000)):

    sudo gem install bundler
    bundle install
    bundle exec jekyll serve
    

