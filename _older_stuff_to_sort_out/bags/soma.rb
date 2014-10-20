require_relative 'paths'
require 'yaml'

class Soma # module?
  extend Paths

  def self.load
    wrap YAML.load_file channels_file
  end

  def self.save soma
    File.write channels_file, YAML.dump(soma)
  end

  def self.wrap hash
    def hash.images
      self['soma']['channels'].map { |x|
        [ x['img-url'], x['img-file'] ]
      }
    end
    def hash.channels
      self['soma']['channels']
    end
    hash
  end
end
