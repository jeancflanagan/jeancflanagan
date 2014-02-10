---
layout: documentation
title: 'Image Optimization'

---

One of the main features of the site's design is high performance. Images are a key part of performance, as they constitute the main portion of client requests from the server, as measured by file size. The average site in 2014 is approaching two megabytes, while even the largest pages on this site should generally require less than 1 MB and the lightest pages should only be about 150 KB. We are aiming at imperceptible load times under high performance circumstances (< 150 milliseconds) and acceptably fast load times under bandwidth limited circumstances (< 1 second). While doing this, we do not want to optimize images too heavily so that they are noticably compromised in quality or size.

As of launch day on 2014-02-08, the [largest photo page on the site](http://jeancflanagan.com/2012/fall-leaves/) weighed in at 1.1 MB. This page included 4 high resolution photos optimized slightly for quality, but mainly for high resolution. Photo pages are an exception with their relatively large size, but article pages should not have images that exceed 100-200 KB for reasonably sized images. Lower total size is better, especially given the bandwidth constraints.

![Photo of yellow maple leaf](http://static.jeancflanagan.com/images/photosets/2012-11-04-yellow-maple-leaf.jpg)

The process here is to take a high resolution photo (aiming for 1024x685 [in the case of a 3:2 photo](http://static.jeancflanagan.com/images/photosets/2012-11-04-yellow-maple-leaf.jpg)) and optimize heavily in Photoshop or similar software, aiming for 30-60 quality and not going any higher than about 200 KB in total file size. Getting closer to 100 KB or even lower is desirable when more than a couple of images exist on the page.

For writing posts, aim for even higher compression for JPEGs since the photos are not typically the main focus.

## Guidelines

### PNG vs JPEG (and other formats)

#### Important facts about the formats

- **PNG** is lossless and compressed.
- PNG allows for transparency, unlike some other common raster formats like JPEGs.
- Edit a vector source file for a PNG such as SVG, EPS or AI file if it is available.
- **JPEG** is lossy and has quite variable compression.
- Saving the same JPEG over and over again after editing or compressing will result in a loss of data. Any compression applied to a JPEG file will compound, and any details lost cannot be restored without reverting to an earlier source. Only edit in a lossless format (RAW, PSD, PNG, etc.) if many edits need to be made, or if there is a canonical version to edit from originally.
- One peculiarity of JPEG compression is that saving over a file with less compression (e.g. saving at *100 quality* – a larger file size) can increase the file size relative to the original file. Make sure not to bump up the quality unless it has a noticable impact on image quality.
- **GIF** is lossy and is heavily color-limited. Only use GIF when needing (1) animation or (2) heavily compressed simple graphics with very few colors. In most cases PNG or SVG are preferable to GIF. Never use GIF for a photo.
- **SVG** is a lossless vector format written in XML. SVG can be encoded into a document or linked via `src` like any other image format. Use in place of PNG when circumstances demand a perfectly scaled vector image at all resolutions.

#### When to use different formats

- Use PNG when the image is predominantly made up of simple colors or large areas of flat colors. Logos are a good example of this, as are simple graphics or graphics generated from vectors.
- Use JPEG when the image is photographic or exceedingly complex and variable in color. JPEG formats are highly compressed but images with flat areas (like a sky) or hard edges (such as typography on a flat background) will show compression artifacts more acutely. In these cases, increase the compression quality.
- Use SVG when the image needs to be infinitely sharp at any zoom level or pixel density. Logos and icons are a good use case for SVG. SVG support is a bit more limited in browsers, but is approaching universal support in modern browsers. SVG may weigh more than equivalent PNG files.

#### Other details for image formats

- Use **progressive** JPEGs for better loading behavior and sometimes smaller files.
- Watch out for artifacts on plain backgrounds in compressed JPEGs. These artifacts are typically blotches of color compressed together, or odd aliasing and noise around hard edges.
- There is no practical reason to serve JPEG images at *over ~80 quality*. The size tradeoff isn't worth it and the image quality improvement is generally not apparent.
- Use **interlaced** PNGs for better loading behavior.
- Aim for 8-bit PNG rather than 24-bit PNG.
- You can use transparency for PNG, but be sure that the page context supports it. In general, do not use tranparency on any `figure` elements (where most images on the site are enclosed).
- For "embed color profile" don't worry much about it, but your preference for your *photos* is SRGB if anything.

### Target sizes

The target sizes outlined here are rough and idealized, rather than being hard rules to follow. In some cases, higher resolution photos may be needed, but not typically. Lower resolution photos can often be used for the small/narrow and the homepage excerpt sizes without any significant loss in fidelity. There is sufficient CSS support for photos that are not wide enough, but images will definitely look worse if placed into a larger container than the pixel width of the image.

- Small/narrow: ~480 pixels wide
- Small: ~640 pixels wide
- Large: ~960 pixels wide
- Photo posts: ~1024 pixels wide
- Photo homepage excerpt: ~450-640px wide


#### About pixel scaling

Image sizes are somewhat targeted towards smaller screens which may have pixel multiplying behaviors. A current example is Apple's "Retina" scaling, where one pixel is doubled horizontally and vertically, with the viewport calculated the same size (320px wide on an iPhone) but the screen rendered at a higher density (640px wide on the same screen). Modern Android and Windows devices use other similar calculations at mutpliers like 1.25x, 1.5x, 2x and 3x. In some of these cases, images served at higher pixel/viewport ratios may benefit from being oversized. In some cases, an image may look fuzzy or bad if it is only 1x sized (1x PNGs are a key example). Photos are on a sliding scale here, but tend to look better (with diminishing returns) as the pixel density of the source is increased, but *only* on screens that support pixel multiplying. Screens that do not take advantage of this sort of image scaling only pay a penalty in larger file size, with no apparent increase in image quality.

### Organizing photos

- All photos are deployed to a separate static server so that they can be maintained separately from the main site repository. Additionally, more static resources can be requested simulataneously via HTTP from multiple domains than a single domain, so there is a potential slight performance advantage.
- The standard file name is `yyyy-mm-dd-title-of-image.jpg`.
- Post images are stored in the /posts directory in the static directory.
- Photoset images are stored in the /photosets directory in the static directory.
- Other photos (like the About page portrait) are stored in the root of the static folder.
- Add "-featured" to the end of smaller-sized featured photos for excerpts.
