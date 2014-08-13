require 'nokogiri'
require 'open-uri'

class Page
  def self.new url
    html = open(url).read
    Nokogiri.HTML(html).at 'body'
  end
end
