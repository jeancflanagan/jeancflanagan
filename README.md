# Website for Jean C. Flanagan

by Oliver Pattison and Jean Flanagan

This is a collaborative project created by Oliver Pattison and Jean Flanagan. Design, concept and structure are primarily by Oliver, while content is all Jean's. The site is built using (hopefully) modern, standards-compliant HTML and CSS, as a static site using Jekyll.

The *content* of this site (in _posts directory) is licensed under CC-BY [(Creative Commons Attribution 3.0 Unported License)](http://creativecommons.org/licenses/by/3.0/deed.en_US). There is an exception for articles (or snippets linking to articles) that were originally published elsewhere are subject to the copyright specified by those media. All content is authored by Jean Flanagan.

### Goals

- Repository for writing and other content for Jean
- Static HTML site built using Jekyll
- Semantic, maintainable HTML
- Mobile-first CSS
- Responsive, high performance design
- Few images except for photo content, mostly typography and simple styles

### Content

- Writing index
    - Self-published content
    - Content published elsewhere
- Photography (later)
- About page

### Implementation Details

- The entire site was designed intentionally around *real* written content and no ipsums or fillers.
- A drive towards minimalism influenced the initial design of the site. The site is built around the most basic and spare forms, with a content-first ethic.
- On smaller screens, navigation is handled using a footer-anchor pattern.
- Screens are important, but "mobile" and "tablet" devices aren't as much. The site's content and responsive features are shaped with smaller screens in mind first, but no particular device types are assumed at any given viewport width. Features are developed with touch and mobile capabilities in mind, but not with the feature-sets or designs of today's devices specifically.
- Limit use of plugins and JavaScript except where absolutely required.
- No fancy responsive image tricks, just ~1.5-2x scaled images with heavy optimization (10-40 quality JPEGs run through ImageOptim). Why? There will not be enough images to justify a JavaScript or `<picture>` solution. Most images will be relatively small in file size, and larger feature images will be worth the size/performance trade-off on high resolution screens.

### Requirements

#### Broadly

- OS X (not tested in Linux, but most of this should work)
- SSH authentication on your remote server

#### Specifically

- Ruby (tested on 1.9.3p194)
- Ruby Environment Manager - RVM (tested on 1.21.11)
- Jekyll (tested on 1.1.0) and installed dependencies
- ImageOptim (for rakefile)
- ImageOptim-CLI (for rakefile)

### Notes:

- Remote moved 2013-07-12 to GitHub
- Remote added 2013-07-11 at Webfaction Domain
- First commit to Git 2013-07-08
- First code on 2013-06-17
- Initial concept and first sketches 2013-05-27