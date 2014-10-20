class window.Player
  constructor: (named_urls)->
    @audio = new Audio

    # preprocessing urls
    @urls = {}
    for x in named_urls
      @urls[x.name] = x.url


  play: (name)->
    url = @urls[name]
    @audio.src = url
    @audio.play()
