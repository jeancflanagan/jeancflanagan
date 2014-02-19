---
layout: documentation
title: 'Site Configuration'

---

## Glossary

### Terminal

A conventional command line interface (CLI) in OS X that gives you far more power over your system and processes than you would have otherwise. A bit of CLI use is pretty much required for running Jekyll, Git and Rake, but there are ways to get around it for some tasks.

### Git

The version control system that manages the entire past and present of the site. [Git](http://git-scm.com) keeps a running log of commits to the site repository, containing not just the present state of the site, but also all of the changes. Git enables a distributed workflow so that multiple contributors can work on the project side-by-side.

### Repository

The entire site in a single directory. Version control of the files in the repository is handled by Git.

### Jekyll

[Jekyll](http://jekyllrb.com) is a static site generator written in Ruby that builds static HTML (and CSS and XML and more) from plain text files and configuration files that tell Jekyll what to build. Jekyll can be installed on your local machine and commanded from Terminal. The static site can be deployed to a web server. Important files and folders in a Jekyll site:

- `_posts` – where blog-style posts are generated from Markdown files.
- `_layouts` and `_includes` help build templates for the site.
- `_plugins` – advanced configuration for the site.
- `_config.yml` is the main configuration file for the Jekyll site.
- `index.html` – every website needs one!

### Markdown

Markdown is a minimal plain text writing format that can be converted directly into HTML. Most of the content for this site is written in Markdown. Note: you don't have to use Markdown for a Jekyll site, but it can help!

### Ruby

Ruby is a programming language that runs Jekyll. Ruby is *required* to be installed to run Jekyll. All of the plugins for this site are written in Ruby, but nothing else in the repository needs to be. Jekyll and Ruby do all the heavy lifting to build the site.

### Liquid

Liquid is a templating engine built into Jekyll that allows for helpful features like conditional content and HTML templating. This site's design leans very heavily on Liquid templating.

### YAML

YAML is a data format that can be embedded in most Jekyll files (such as Markdown or HTML documents), while also globally configuring the Jekyll site in the `_config.yml` file. YAML can holds metadata in the front matter of these files, which can be used to determine things like the published date, title and template layout of a post (default Jekyll configuration) or more advanced information like excerpt metadata for that post (custom Jekyll configuration).

### Rake/Rakefile

[Rake](http://rake.rubyforge.org) is a tool written in Ruby that builds things to your specification. A Rakefile is written which contains the commands (written in Ruby) which are executed when called from the command line. An example of this would be using the command `rake post` to generate a blank post from a template. You can deploy the site with `rake deploy`.

### Amazon S3

Amazon's Simple Storage Service (S3) hosts every file on the site. S3 is relatively inexpensive, highly scalable storage that can also serve static websites via HTTP. This site is deployed to two S3 "buckets" (piles of files) which are immediately available publicly on the web. One bucket hosts the main site and the other hosts other static content like images. `s3_website` (used in the Terminal directly or via a Rake command) deploys the site to S3.

- - -

## How metadata in Jekyll works

~

## Layout

~

## Style

~

### Color

~

## Creating new posts

The site uses a custom Rakefile to simplify and standardize the creation of new posts. A template is auto-generated according to the Jekyll specification and this particular site's structure. The `rake post` command generates a new post with mostly empty metadata and converts the title to a Jekyll-standardized format (`yyyy-mm-dd-post-title.md`) and adds it to the `_posts` folder.

1. In a Terminal window, navigate to the project directory (default: `repos/jeancflanagan`).
1. Enter the command `rake post`.
1. When prompted, enter the name of the post as it should appear as a title.
1. When prompted, enter 'y' if it is a photo post or 'n' if it is not.
1. Open the post in a text editor. (One shortcut for this is to copy/paste the title of the post which is provided by the command line as `_posts/filename.md` and then enter the command `open _posts/filename.md`.)

The photo post type generates slightly different metadata than the standard writing type, since it has different requirements. An example of this is `excerpt_photo` which is the featured photo for the excerpts on the main and photo index pages. Certain metadata items are not optional such as `period` which is inserted as a rough timeframe (such as `July 2015`) for the main index excerpts.

The date/time generated is the exact moment of creation, but it can be edited afterward if desired. Edit the date/time in the post metadata *as well as the date in the Jekyll file name*.

### Creating a new post using Alfred

I created a workflow in Alfred that makes it easier to run common command line tasks such as Rake or Jekyll commands without needing to open a new Terminal process manually or remember as many commands. The syntax is:

`rake post` (starting to type the command and then tabbing will auto-complete) + `jeancflanagan` (the repo folder)

For the recipe to work by default, it requires that any repo it is supposed to work with is included in a directory called `repos` stored within the main user directory.