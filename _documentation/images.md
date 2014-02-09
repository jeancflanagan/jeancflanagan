---
layout: documentation
title: 'Image Optimization'

---

One of the main aspects of the site's design is high performance. Images are a key part of performance, as they constitute the main load on client requests from the server. The average site in 2014 is approaching two megabytes, while even the largest pages on this site should generally require less than 1 MB and the lightest pages should only be about 150 KB. We are aiming at imperceptible load times under high performance circumstances (< 150 milliseconds) and acceptably fast load times under bandwidth limited circumstances (< 1 second). While doing this, we do not want to edit images too heavily so that they are noticably compromised in quality or size.

As of launch day on 2014-02-08, the [largest photo page on the site](http://jeancflanagan.com/2012/fall-leaves/) weighed in at 1.1 MB. This page included 4 high resolution photos optimized slightly for quality, but mainly for high resolution. Photo pages are an exception with their relatively large size, but article pages should not have images that exceed 100-200 KB for reasonably sized images. Lower is better, especially given the bandwidth constraints.

The process here is to take a high resolution photo (aiming for 1024x685 [in the case of a 3:2 photo](http://static.jeancflanagan.com/images/photosets/2012-11-04-yellow-maple-leaf.jpg)) and optimize heavily in Photoshop or similar software, aiming for 30-60 quality and not going any higher than about 200 KB in total file size. Getting closer to 100 KB or even lower is desirable when

## Guidelines

### PNG vs JPEG (and other formats)

#### Important facts about the formats

- **PNG** is lossless and compressed.
- Edit a vector source file for a PNG such as SVG, EPS or AI file if it is available.
- **JPEG** is lossy and has quite variable compression.
- Saving a JPEG over and over again will result in a loss of data. Only edit in a lossless format (RAW, PSD, PNG, etc.) if many edits need to be made, or if there is a canonical version to edit from originally.
- **GIF** is lossy and is heavily color-limited. Only use GIF when needing (1) animation or (2) heavily compressed simple graphics with very few colors. In most cases PNG or SVG are preferable to GIF. Never use GIF for a photo.
- **SVG** is a lossless vector format written in XML. SVG can be encoded into a document or linked via `src` like any other image format. SVG support is a bit more limited in browsers, but is approaching universal support in modern browsers. Use in place of PNG when circumstances demand a perfectly scaled vector image at all resolutions.

#### When to use different formats

- Use PNG when the image is predominantly made up of simple colors or large areas of flat colors. Logos are a good example of this, as are simple graphics or graphics generated from vectors.
- Use JPEG when the image is photographic or exceedingly complex and variable in color. JPEG formats are highly compressed but images with flat areas (like a sky) or hard edges (such as typography on a flat background) will show compression artifacts more acutely. In these cases, increase the compression quality.