require_relative '../page'

class Channels
  URL = 'http://somafm.com'

  def self.scrap
    page = Page.new URL
    channels = page.css('#stations ul li').map { |node|
      Channel[node, URL].extract
    }
    channels
  end
end

class Channel < Struct.new :node, :root
  def extract
    {
      'name'     => name,
      'desc'     => desc,
      'id'       => id,
      'img-file' => img_file,
      'img-url'  => img_url,
    }
  end

  def name
    node.at('h3').text
  end

  def desc
    node.at('p.descr').text
  end

  def id
    node.at('a[href]')[:href].gsub ?/,''
  end

  def img_url
    abs node.at('a[href] > img')[:src]
  end

  def img_file
    img_url.split(?/).last
  end

  def abs path
    [root, path].join
  end
end
