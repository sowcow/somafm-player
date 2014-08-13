#require 'sprockets'
require 'opal'

task :opal do
  Opal::Processor.source_map_enabled = false
  env = Opal::Environment.new
  env.append_path 'app'

  File.write 'public/app.js', env['app'].to_s
end
