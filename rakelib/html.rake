require 'slim'
require 'sass'
require_relative 'soma'

task :html => :opal do
  soma = Soma.load
  html = html_compile channels: soma.channels
  File.write 'public/index.html', html
  # no need for constant in tasks I guess
end

def html_compile hash
  Slim::Template.new { SLIM_TEMPLATE }.render \
    Scope.new hash
end

SLIM_TEMPLATE = <<slim
doctype 5
html lang='en'
  head
    title soma-fm
    meta charset='utf-8'
    script href='app.js'
    sass:
      img
        float: left
  body
    - channels.each do |channel|
      /div = channel.name.to_s
      img src="images/\#{channel.send('img-file')}"
slim

# nested hashes get individual methods for fetching
#
class Hashy < SimpleDelegator

  def self.wrap thing
    case thing
    when Hash then new thing
    when Array then new thing
    else thing # no wrapping
    end
  end

  def initialize given
    case given
    when Hash
      hash = given
      hash.each { |key, value|
        define_singleton_method key do Hashy.wrap value end
      }
    when Array
      array = given
      __setobj__ array.map { |x| Hashy.wrap x }
    else
      # do nothing
    end
  end
end

Scope = Hashy
