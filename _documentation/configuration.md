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

[Markdown](http://daringfireball.net/projects/markdown/) is a minimal plain text writing format that can be converted directly into HTML. Most of the content for this site is written in Markdown. Note: you don't have to use Markdown for a Jekyll site, but it can help!

### Ruby

[Ruby](https://www.ruby-lang.org/en/) is a programming language that runs Jekyll. Ruby is *required* to be installed to run Jekyll. All of the plugins for this site are written in Ruby, but nothing else in the repository needs to be. Jekyll and Ruby do all the heavy lifting to build the site.

### Liquid

[Liquid](http://liquidmarkup.org) is a templating engine built into Jekyll that allows for helpful features like conditional content and HTML templating. This site's design leans very heavily on Liquid templating.

### YAML

[YAML](http://www.yaml.org) is a data format that can be embedded in most Jekyll files (such as Markdown or HTML documents), while also globally configuring the Jekyll site in the `_config.yml` file. YAML can holds metadata in the front matter of these files, which can be used to determine things like the published date, title and template layout of a post (default Jekyll configuration) or more advanced information like excerpt metadata for that post (custom Jekyll configuration).

### Rake/Rakefile

[Rake](http://rake.rubyforge.org) is a tool written in Ruby that builds things to your specification. A Rakefile is written which contains the commands (written in Ruby) which are executed when called from the command line. An example of this would be using the command `rake post` to generate a blank post from a template.

### Amazon S3

[Amazon's Simple Storage Service (S3)](http://aws.amazon.com/s3/) hosts every file on the site. S3 is relatively inexpensive, highly scalable storage that can also serve static websites via HTTP. This site is deployed to two S3 "buckets" (piles of files) which are immediately available publicly on the web. One bucket hosts the main site and the other hosts other static content like images. `s3_website` (used in the Terminal directly or via a Rake command) deploys the site to S3.

- - -

## How metadata in Jekyll works

Metadata is referred to in nearly any Markdown or HTML file with **YAML front matter**, a form of metadata for that page which is stored in protected blocks (typically with `---` opening and closing that code block). Whatever lies in between the markers is treated by Jekyll as YAML *instead of being treated as the native file format such as HTML*. Here is an example of how it works:

### Metadata with Liquid variables

To select the title for a particular page, we can set the HTML for a page like this: `<title>{{ page.title }}</title>`. This Liquid variable inserts the `title` for the parent `page`. `title` is a YAML metadata key, and `page` refers to the type of layout. In this case, the value asigned to `page.title` is returned to the generated HTML document.

[Read more on Jekyll's YAML front matter](http://jekyllrb.com/docs/frontmatter/).

## How Liquid includes work

This is how the navigation is inserted into the `fundamental.html` file (the main layout called by all other layouts in the `_layouts` directory):

`{% include site-nav.html %}`

By asking Liquid to **include** the `site-nav.html` file, we are pulling that file from the `_includes` folder in the Jekyll repository. This will take whatever HTML code is stored in that file and insert it into the `fundamental.html` file. By adding multiple includes and layouts together, we can generate a full HTML document, built out of condtional and template-driven content.

## How Liquid content works

All that needs to be done to insert Markdown or raw HTML into a document is to insert `{{ content }}`. This takes whatever content is included (perhaps a raw file from `_posts` or instead a parent layout.) Here's the trick: calling a parent layout in the YAML front matter (like `layout: fundamental.html`) will include that parent layout *as well as* any other layout or include code that make up that layout.

[Read much more on Jekyll templating](http://jekyllrb.com/docs/templates/).

- - -

## HTML

The site is written in semantic and structured HTML, adhering as closely as possible to [HTML5 specification](http://www.w3.org/TR/html5/) ([see also the WHATWG living standard](http://www.whatwg.org/specs/web-apps/current-work/multipage/). Some of the HTML is generated by Kramdown, a Markdown processor that Jekyll uses.

## Style

The `site.css` file styles the entire site (styles for older browsers like Internet Explorer 7 and 8 are handled by an analagous `ieold.css` file). 

The CSS for the site is the key to the responsive behavior of the site, with default styles defining layout and typography for small screens first. This is known as "mobile-first" CSS, and it was designed "content-first". Media queries are CSS rules that ask a client browser about the size of its viewport and serve conditional styles based on that query. Larger screens are assigned wider horizontal media queries, which provide different styles that overwrite some of the default "small screen" styles.

Any CSS selectors that are rewritten or reworked should take media queries into consideration, as small changes can have dramatic or unpredictable effects on how the site is rendered.

Older browsers (like IE7 and IE8) *do not* support media queries, modern CSS, nor some HTML5 elements, which is why they are conditionally served a more minimal "non-responsive stylesheet.

### Typography

[Adobe Typekit](https://typekit.com) serves fonts for the site. The site is set in Calluna (serif) and Open Sans.

### Color

The colors for the site's CSS are stored in the `_config.yml` site config. [HSL](http://hslpicker.com) and [hex](http://en.wikipedia.org/wiki/Web_colors#Hex_triplet) colors are stored in YAML, and then inserted in every color declaration in the CSS files for the site.

- - -

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