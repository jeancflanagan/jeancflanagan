module Jekyll
  class FigureTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super

      if 
        markup =~ /(page\.image\[\d\])\s+(page\.image_alt\[\d\])\s+(page\.image_caption\[\d\])\s+(right|left)?/i
        @src = "{{ site.image_url }}{{ #{$1} }}"
        @alt = "{{ #{$2} }}"
        @caption = "{{ #{$3} | markdownify }}"
        @align = $4
      end
    end

    def render(context)

      @src = Liquid::Template.parse(@src).render(context)
      @alt = Liquid::Template.parse(@alt).render(context)
      @caption = Liquid::Template.parse(@caption).render(context)

      "<figure class=\"#{@align}\"><img src=\"#{@src}\" alt=\"alt\"/><figcaption>#{@caption}</figcaption></figure>"

    end
  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)