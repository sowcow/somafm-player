require 'slim'
require 'sass'
require 'coffee-script'
require 'yaml'
require 'json'

TITLE = 'soma-fm'
JS_FILES = [
  'd3.js'
]
COFFEE_FILES = [
  'coffee/global.coffee', # helpers, etc
  'coffee/player.coffee', # nice unit
  'coffee/svg.coffee',    # nice unit
  'coffee/d3.coffee',     # okish
  'script.coffee'    # glue, config, running
]

END{
  make if __FILE__ == $0
}

def out; 'public' end

def make
  make_html
  make_json
  puts 'updated'
end

def make_json
  hash = stations.map { |x| [x,x.basename.to_s] }
  .map { |x,name|
    data_file = x + 'data.yml'
    data = YAML.load_file data_file
    url = data['sources']['mp3'].first
    url += '/;'
    { name: name, url: url }
  }

  json = JSON.dump hash
  File.write "#{out}/stations.json", json
end

def make_html
  slim = File.read 'base.slim'
  sass = File.read 'style.sass'

  js = COFFEE_FILES.map { |file|
    coffee = File.read file
    CoffeeScript.compile coffee
  }.join(?\n)

  css = Sass.compile sass, syntax: :sass

  context = Context.new\
    title: TITLE,
    css: css,
    js: js,
    js_files: JS_FILES,
    patterns: patterns

  html = Slim::Template.new { slim }.render context
  
  File.write "#{out}/index.html", html
end
 
require 'pathname'
require 'yaml'

def stations
  #dir = Pathname '../../august/soma-html5/stations'
  dir = Pathname '_xz/stations'
  Pathname.glob dir + '*'
end

def patterns
  all = []
  base = {
    h1: 120,
    h2: 120,
    w1: 120,
    w2: 120,
    units: 'userSpaceOnUse'
  }
  stations.each { |dir|
    file = dir + 'this.yml'
    data = YAML.load_file file
    data.merge! file: data['img-file']
    data.merge! base
    all << Pattern.new(data)
  }
  all
end

END{
  Pattern = Context
}

class Context
  def initialize fields
    fields.each { |name, value|
      define_singleton_method name do value end
    }
  end
end
