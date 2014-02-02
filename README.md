# Website for Jean C. Flanagan

Jean is a science education specialist and writer. The site is designed with a content-first approach – particularly focused on readability.

This is a collaborative project created by Oliver Pattison and Jean Flanagan. Design, concept and structure are primarily by Oliver, while content is all Jean's. The site is built using (hopefully) modern, standards-compliant HTML and CSS, as a static Jekyll site.

The *content* of this site (in _posts directory) is licensed under CC BY-NC [(Creative Commons Attribution 3.0 Unported License)](http://creativecommons.org/licenses/by-nc/4.0/deed.en_US). There is an exception for articles (or snippets linking to articles) that were originally published elsewhere are subject to the copyright specified by those media. All content is authored by Jean Flanagan.

### Goals

- Repository for writing and other content for Jean
- Static HTML site built using Jekyll, version-controlled with Git
- Semantic, maintainable HTML
- Mobile-first CSS
- Responsive, high performance design
- Optimized for readability at all screen sizes

### Content

- Writing index
    - Self-published content
    - Content published elsewhere
- Photography
    - Photosets of 1-10 photos
- About page

### Implementation Details

- The entire site was designed intentionally around *real* written content and no ipsums or fillers.
- A drive towards minimalism influenced the initial design of the site, focusing on content before style or presentation.
- Screens are important, but "mobile" and "tablet" devices aren't as much. The site's content and responsive features are shaped with smaller screens in mind first, but no particular device types are assumed at any given viewport width. Features were developed with touch and mobile capabilities in mind, but not with the feature-sets or designs of today's devices specifically.
- On smaller screens, navigation is handled using a [footer-anchor pattern](http://codepen.io/opattison/pen/FbJmf).
- We limited use of plugins and JavaScript except where absolutely required.
- There are no fancy responsive image tricks; just ~1.5-2x scaled images (known as the "compressive images" solution) with heavy optimization. Optimization includes lowering JPEG quality more than you normally might, while retaining larger heights and widths for images on the site, often full-width. Why? There will not be enough images to justify a JavaScript or `<picture>` solution. Most images will be relatively small in file size, and larger feature images will be worth the size/performance trade-off on high resolution screens. More and more browsers will be working in a pixel-multiplied environment of 1.5x or greater in the future, and almost all mobile devices already do.
- Automated image optimization is a part of the build process, using Rake and ImageOptim. 

### Requirements

#### Broadly

- OS X (not tested in Linux, but most of this should work)
- Amazon S3 for hosting

#### Specifically

- Ruby (tested on 1.9.3p194)
- Ruby Environment Manager - RVM (tested on >1.21.11)
- [Jekyll](https://github.com/mojombo/jekyll) (tested on >1.1.0) and installed dependencies
- [S3_website](https://github.com/laurilehmijoki/s3_website) (tested on >v1.3.2)
- [ImageOptim](http://imageoptim.com/) (for rakefile)
- [ImageOptim-CLI](https://github.com/JamieMason/ImageOptim-CLI) (for rakefile)

### Notes:

- Remote moved 2013-07-12 to GitHub
- First commit to Git 2013-07-08
- First code on 2013-06-17
- Initial concept and first sketches 2013-05-27