require_relative 'soma'
require_relative 'page'

task :audio_sources do
  soma = Soma.load

  soma['soma']['channels'].map! do |channel|
    id = channel['id']
    channel['sources'] = {}
    channel['sources']['mp3'] = []
    channel['sources']['mp3'].push *servers_by_id(id)
    channel
  end

  Soma.save soma
end


def servers_by_id id
  page = Page.new(
    "http://somafm.com/#{id}/directstreamlinks.html")

  direct = page.css('p.url').find { |x|
    x.text =~ /Direct Server: / }.
      text.sub(/Direct Server: /,'')

  backup = page.css('p.url').find { |x|
    x.text =~ /Backup Server: / }.
      text.sub(/Backup Server: /,'')

  [direct] #, backup]
end
