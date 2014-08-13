require_relative 'bags/bags'
# bags are totally seperated rake tasks
# so I have no problems with gems...

directory 'public'
directory 'public/images' => 'public'
task :download_images => 'public/images'
task :produce_html => 'public'
# dirs stuff may be arranged in a Paths module...
# so for example path ensured to exist when it is used

task :default => :full_update


desc 'updates all: channels, images, sources'

task :full_update => [
  :scrap_channels,
  :download_images,
  :scrap_audio_sources,
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
