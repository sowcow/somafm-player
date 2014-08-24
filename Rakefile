require_relative 'bags/bags'
# bags are totally seperated rake tasks
# so I have no possible problems with gems...
# cuz they canhave seperate Gemfile-s

task :default => :run


desc 'just a server'
task :serve do
  system 'ruby -run -e httpd public -p 3000'
end

desc 'run as an app'
task :run do
  system 'midori --app=http://localhost:3000 &'
  Rake::Task[:serve].invoke
end


desc 'run in a browser'
task :debug do
  system 'chromium http://localhost:3000 &'
  Rake::Task[:serve].invoke
end

directory 'public'
directory 'public/images' => 'public'
task :download_images => 'public/images'
task :produce_html => 'public'
# dirs stuff may be arranged in a Paths module...
# so for example path ensured to exist when it is used



desc 'updates all: channels, images, sources'

task :full_update => [
  :scrap_channels,
  :download_images,
  :scrap_audio_sources,
  :compile_opal,
  :produce_html
]
  

desc 'updates sources only'

task :update_sources => [
  :scrap_audio_sources, :produce_html
]

%w[
  scrap_channels
  download_images
  scrap_audio_sources
  produce_html
  compile_opal

].each { |name|
  task name do bags name end
}
