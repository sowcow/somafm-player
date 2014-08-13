require 'yaml'

class Soma
  FILE = 'channels.yml'

  def self.load
    wrap YAML.load_file FILE
  end

  def self.save soma
    File.write FILE, YAML.dump(soma)
  end

  def self.wrap hash
    def hash.images
      self['soma']['channels'].map { |x|
        [ x['img-url'], x['img-file'] ]
      }
    end
    hash
  end
end
