require 'pathname'

module Paths

  module_function

  bags_at = Pathname(__FILE__).parent.expand_path
  define_method(:bags_dir) { bags_at }


  def project_dir; bags_dir.parent
  end
  def channels_file; project_dir + 'channels.yml'
  end
  def images_dir; output_dir + 'images'
  end
  def output_dir; project_dir + 'public'
  end
  def jsfile; output_dir + 'app.js'
  end
  def opal_dir; project_dir + 'app'
  end
  def html_file; output_dir + 'index.html'
  end
end
