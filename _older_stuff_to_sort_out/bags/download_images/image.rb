require_relative '../paths'
require 'open-uri'

class Image
  extend Paths

  def self.download url, name
    File.write images_dir + name, open(url).read
  end
end
