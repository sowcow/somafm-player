# see rakelib/*.rake

task :default => [ :full_update ]

desc 'updates all: channels, images, sources'
task :full_update => [
  :channels, :images, :audio_sources, :html ]

desc 'updates sources only'
task :update_sources => [ :audio_sources, :html ]
