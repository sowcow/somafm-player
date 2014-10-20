#require 'opal'
#require 'jquery'
#require 'opal-jquery'
require 'native'


class ThePlayer
  def initialize
    @player = Element.new('audio')
    #puts @player.class
    #puts @player.length
    @player = Native `self.player[0]`
  end

  def play channel
    @channel = channel

    puts "playing #@channel"
    play_url channel_url @channel
  end

  # -- not in use yet --
  #def current_song
  #  url = "http://android.somafm.com/songs/#@channel.xml"
  #  HTTP.get url do |r|
  #    xml = r.body
  #    puts xml
  #  end
  #end

  private
  def play_url url
    url += '/;'
    @player.src = url
    @player.play
  end

  def channel_url channel
    found = `Channels`.find { |x| `x.id === channel` }\
      or raise
    `found.sources.mp3[0]`
  end
end
