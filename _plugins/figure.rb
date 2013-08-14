module Jekyll
  class FigureTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      @align = nil
      @src = ''
      @alt = ''
      @caption = nil

      if 
        markup =~ /(right\s|left\s+)?(page.image\[\d\])(\s+page.image_alt\[\d\])?(\s+page.image_caption\[\d\])?/
        @align = $1
        @src = "{{ site.image_url }}{{ #{$2} }}"
        @alt = "{{ #{$3} }}"
        @caption = "{{ #{$4} | markdownify }}"
      end
    end

    def render(context)
      @src = Liquid::Template.parse(@src).render(context)
      @alt = Liquid::Template.parse(@alt).render(context)
      @caption = Liquid::Template.parse(@caption).render(context)

      if @align
        figure = "<figure class=\"#{@align}\">"
      else
        figure = "<figure>"
      end

      figure += "<img src=\"#{@src}\" alt=\"#{@alt}\"/>"
      
      if @caption 
        figure += "<figcaption>#{@caption}</figcaption>"
      end
      
      figure += "</figure>"

    end
  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)