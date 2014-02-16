---
layout: documentation
title: 'Site Configuration'

---

## Creating new posts

The site uses a custom Rakefile to simplify and standardize the creation of new posts. A template is auto-generated according to the Jekyll specification and this particular site's structure. The `rake post` command generates a new post with mostly empty metadata and converts the title to a Jekyll-standardized format (`yyyy-mm-dd-post-title.md`) and adds it to the `_posts` folder. 

1. In a Terminal window, navigate to the project directory (default: `repos/jeancflanagan`).
1. Type `rake post`.
1. When prompted, enter the name of the post as it should appear as a title.
1. When prompted, enter 'y' if it is a photo post or 'n' if it is not.
1. Open the post in a text editor. (One shortcut for this is to copy/paste the title of the post which is provided by the command line as `_posts/filename.md` and then enter the command `open _posts/filename.md`.)

The photo post type generates slightly different metadata than the standard writing type, since it has different requirements. An example of this is `excerpt_photo` which is the featured photo for the excerpts on the main and photo index pages. Certain metadata items are not optional such as `period` which is inserted as a rough timeframe (such as `July 2015`) for the main index excerpts.

The date/time generated is the exact moment of creation, but it can be edited afterward if desired. Edit the date/time in the post metadata *as well as the date in the Jekyll file name*.

### Creating a new post using Alfred

I created a workflow in Alfred that makes it easier to run common command line tasks such as Rake or Jekyll commands without needing to open a new Terminal process manually or remember as many commands.