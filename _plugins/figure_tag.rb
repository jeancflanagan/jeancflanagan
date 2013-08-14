# Title: Figure/image tag plugin for Jekyll
# Author: Oliver Pattison http://oliverpattison.org
# Description: Create figure/img HTML blocks with optional class and captions. A Liquid tag plugin for Jekyll.
# 
# Download/source/issues: https://github.com/opattison/jekyll-figure-image-tag
# Documentation: https://github.com/opattison/jekyll-figure-image-tag/blob/master/README.md
# 
# Note: designed specifically for implementations with images, captions and alt text in post YAML Front Matter.
# 
# Create YAML collections like this:
# 
#   image:
#     - path/to/image
#     - path/to/another-image
# 
# Make sure to have an image host specified in the _config.yml file. Like:
# 
#   image_url: http://images.example.com/
# 
# Syntax: {% figure [class name(s)] /path/to/image 'alt text' 'caption text' %}
# 
# Sample (all, with front matter): 
# {% figure left {{ page.image[1] }} {{ page.image_alt[1] }} {{ page.image_caption[1] }} %}
#
# Output:
# <figure class="left">
#   <img src="http://images.example.com/solar-farm.jpg" alt="Landscape view of solar farm">
#   <figcaption>
#     <p>Photos from my trip to [the solar farm](http://example.com).</p>
#   </figcaption>
# </figure>
#

module Jekyll
  class FigureTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      @class = nil #not required
      @src = ''
      @alt = ''
      @caption = nil #not required

      if 
        #regex that grabs the src and alt at minimum, but optionally alt and caption
        markup =~ /(\S.*\s+)?(page.image\[\d\])(\s+page.image_alt\[\d\])?(\s+page.image_caption\[\d\])?/
        @class = $1
        @src = "{{ #{$2} }}"
        @alt = "{{ #{$3} }}"
        @caption = "{{ #{$4} | markdownify }}" #markdownified so it can contain hyperlinks
      end
    end

    def render(context)
      # making sure that liquid tags referencing the front matter are parsed as liquid tags
      @src = Liquid::Template.parse(@src).render(context)
      @alt = Liquid::Template.parse(@alt).render(context)
      @caption = Liquid::Template.parse(@caption).render(context)
      @site_url = Liquid::Template.parse("{{ site.image_url }}").render(context)

      if @class
        figure = "<figure class=\"#{@class}\">"
      else
        figure = "<figure>"
      end

      figure += "<img src=\"#{@site_url}#{@src}\" alt=\"#{@alt}\"/>"
      
      if @caption 
        figure += "<figcaption>#{@caption}</figcaption>"
      end
      
      figure += "</figure>"

    end
  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)