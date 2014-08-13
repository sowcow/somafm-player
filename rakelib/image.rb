require 'open-uri'

class Image
  IMAGES_PATH = 'public/images'
                    # I think it is good that paths
                    # configured at compile-time
                    # but currently there is no such place
                    # for them, and may be other constants

  def self.download url, name
    data = open(url).read
    result = File.join IMAGES_PATH, name
    File.write result, data
  end
end
