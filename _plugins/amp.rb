module Jekyll
  class Amp700Tag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      @class = nil #not required
      @src = ''
      @alt = 'BestBitcoinExchange'
      @caption = nil #not required

      if markup =~ /(\S.*\s+)?(page.image\[\d\])(\s+page.image_alt\[\d\])?(\s+page.image_caption\[\d\])?/
        #regex that grabs the src and alt at minimum, but optionally alt and caption
        @class = $1
        @src = $2
        @alt = $3
        @caption = $4
      end
    end

    def render(context)
      # making sure that liquid tags referencing the front matter are parsed as liquid tags
      @src = Liquid::Template.parse("{{ #{@src} }}").render(context)
      @alt = Liquid::Template.parse("{{ #{@alt} }}").render(context)
      @caption = Liquid::Template.parse("{{ #{@caption} | markdownify }}").render(context)
      @site_url = Liquid::Template.parse("{{ site.image_url }}").render(context)


      if @class
        amp = "<a target=\"_blank\" href=\"#{@site_url}#{@src}\"><figure class=\"#{@class}\"><amp-img itemprop=\"image\" "
      else
        amp = "<a target=\"_blank\" href=\"#{@site_url}#{@src}\"><figure class=\"post\"><amp-img itemprop=\"image\" "
      end

      amp += "src=\"#{@site_url}#{@src}\" alt=\"#{@alt}\" layout=\"responsive\" width=\"700px\" height=\"360px\" >" #width=\"520px\" height=\"270px\"
      amp += "</amp-img></figure></a>"
#480 854
    end
  end
end

Liquid::Template.register_tag('amp700', Jekyll::Amp700Tag)


#
#   image:
#     - path/to/image
#     - path/to/another-image
#
# Make sure to have an image host specified in the _config.yml file:
#
#   image_url: http://images.example.com/
#
# Syntax:
# {% amp-img [class name(s)] /path/to/image 'alt text' ['caption text'] %}
#
# Sample (typical use):
# {% amp-img left {{ page.image[0] }} {{ page.image_alt[0] }} {{ page.image_caption[0] }} %}
#




module Jekyll
  class AmpDoubleTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      @class = nil #not required
      @src = ''
      @alt = 'BestBitcoinExchange'

      if markup =~ /(\S.*\s+)?(page.image\[\d\])(\s+page.image_alt\[\d\])?(\s+page.tall\[\d\])?/
        @class = $1
        @src = $2
        @alt = $3
      end
    end

    def render(context)
      # making sure that liquid tags referencing the front matter are parsed as liquid tags
      @src = Liquid::Template.parse("{{ #{@src} }}").render(context)
      @alt = Liquid::Template.parse("{{ #{@alt} }}").render(context)
      @site_url = Liquid::Template.parse("{{ site.image_url }}").render(context)

      if @class
        amp = "<figure class=\"#{@class}\"><amp-img itemprop=\"image\" "
      else
        amp = "<figure class=\"post\"><amp-img itemprop=\"image\" "
      end

      amp += "src=\"#{@site_url}#{@src}\" alt=\"#{@alt}\" "
      amp += "data-original-width=\"960px\" data-original-height=\"854px\" layout=\"responsive\" width=\"960px\" height=\"854px\">"
      amp += "</amp-img></figure>"
#480 854
    end
  end
end

Liquid::Template.register_tag('ampdouble', Jekyll::AmpDoubleTag)


module Jekyll
  class AmpTallTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      @class = nil #not required
      @src = ''
      @alt = 'BestBitcoinExchange'

      if markup =~ /(\S.*\s+)?(page.image\[\d\])(\s+page.image_alt\[\d\])?(\s+page.tall\[\d\])?/
        @class = $1
        @src = $2
        @alt = $3
      end
    end

    def render(context)
      # making sure that liquid tags referencing the front matter are parsed as liquid tags
      @src = Liquid::Template.parse("{{ #{@src} }}").render(context)
      @alt = Liquid::Template.parse("{{ #{@alt} }}").render(context)
      @site_url = Liquid::Template.parse("{{ site.image_url }}").render(context)

      if @class
        amp = "<figure class=\"#{@class}\"><amp-img itemprop=\"image\" "
      else
        amp = "<figure class=\"post\"><amp-img itemprop=\"image\" "
      end

      amp += "src=\"#{@site_url}#{@src}\" alt=\"#{@alt}\" "
      amp += "data-original-width=\"480px\" data-original-height=\"854px\" layout=\"responsive\" width=\"480px\" height=\"854px\">"
      amp += "</amp-img></figure>"
#480 854
    end
  end
end

Liquid::Template.register_tag('amptall', Jekyll::AmpTallTag)






=begin
<figure class="inline-image lead-image">
<div class="image-credit-wrapper">
<span class="image-credit">Liverpool Echo</span>
<amp-img src="http://i1.mirror.co.uk/" itemprop="image" data-original-width="1200"
data-original-height="800" layout="responsive" height="800" width="1200"></amp-img>
</div>
<figcaption>
</figure>
=end

=begin
      if @caption
        amp += "</figure></amp-img>"
      else
        amp += "<figcaption>#{@caption}</figcaption></amp-img>"
      end
=end
