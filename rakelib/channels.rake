require_relative 'soma'
require_relative 'channels'

task :channels do
  channels = Channels.scrap
  soma = {
    'soma' => {
      'at' => Time.now,
      'channels' => channels
    }
  }
  Soma.save soma
end
