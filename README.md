# Website for [Jean Flanagan](https://jeancflanagan.com)

Jean is a science education specialist and writer. [This site](https://jeancflanagan.com) is a collaborative project created by Oliver Pattison and Jean Flanagan. Design, concept and structure are primarily by Oliver, while content is all Jean’s.

The *content* of this site (in the `_posts` and `_photos` directories) is licensed under CC BY-NC [(Creative Commons Attribution 4.0 License)](https://creativecommons.org/licenses/by-nc/4.0/). There is an exception for articles (or snippets linking to articles) that were originally published elsewhere are subject to the copyright specified by those media. All content is authored by Jean Flanagan.

## Goals

- Professional home page and archive for Jean
- Static HTML site built using Jekyll, version-controlled with Git
- Responsive, high performance design
- Minimalism in design and implementation
- Optimized for readability at various screen sizes

## Implementation Details

- Building: [Jekyll](http://jekyllrb.com) and [npm scripting](https://docs.npmjs.com/cli/run-script) for optimizing SCSS, JS and SVG assets and speeding up my process
- Archive generation: [Jekyll Archives](https://github.com/jekyll/jekyll-archives) gem
- Hosting: Amazon [CloudFront](https://aws.amazon.com/cloudfront/), [S3](https://aws.amazon.com/s3/) and [imgix](https://www.imgix.com) for hosting; [AWS ACM](https://aws.amazon.com/certificate-manager/) for TLS (HTTPS) certificate
- Deploying: [s3_website](https://github.com/laurilehmijoki/s3_website), via [Travis CI](https://travis-ci.org)
- Version control: GitHub
- Typography: [Adobe Typekit](https://typekit.com/colophons/cai2isa) – 400 and 600 weights of [the Soleil typeface](http://www.type-together.com/Soleil)
- Layout: custom [`flexbox`](https://www.w3.org/TR/2016/CR-css-flexbox-1-20160301/) CSS
- Responsive images: [`srcset`](https://responsiveimages.org), processed and optimized with [imgix](https://www.imgix.com/)
- A minimum of front-end JavaScript.

## Notes

The entire site was designed intentionally around *real* written content and no ipsums or fillers. A minimalist approach influenced the initial design of the site, focusing on content before style or presentation.

Screens are important, but “mobile” and “tablet” devices aren’t as much. The site’s content and responsive features are shaped with smaller screens in mind first, but no particular device types are assumed at any given viewport width. Features were developed with touch and mobile capabilities in mind, but not with the feature-sets or shapes of today’s devices specifically.

- [Redesigned](https://jeancflanagan.com) 2016-10-03
- [Launched](https://2016.jeancflanagan.com) 2014-02-08
- Development started 2013-06-17
- Initial concept and first sketches 2013-05-27
