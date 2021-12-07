module Jekyll
  class ImgTag < Liquid::Tag

    def initialize(tag_name, content, tokens)
      super
      @url, @width = content.strip.split(' ')
      @width ||= "100%"
    end

    def render(context)
      date = context.registers[:page]["date"]
      year = date.year
      month = date.month.to_s.rjust(2, '0')
      "<img src=\"/img/#{year}-#{month}/#{@url}\" alt=\"\" width=\"#{@width}\">"
    end
  end
end

Liquid::Template.register_tag('img', Jekyll::ImgTag)
