require 'opal'
require 'jquery'
require 'opal-jquery'

require 'player' # ThePlayer for now


Document.ready? do
  Player = ThePlayer.new # dynamic constant assignment?
                         # todo Singelton?

  channels = Element.find '.channel'
  channels.on :click do |e|
    channel = e.current_target.attr 'x-id'
    Player.play channel
  end
end
