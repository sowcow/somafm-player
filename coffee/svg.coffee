class window.SVG
  constructor: (selector)->
    @svg = d3.select selector
    @configure()

  configure: =>
    @fills_the_whole_window()
    @ignores_right_click()
    @resizes_with_window()

  fills_the_whole_window: =>
    @svg.attr
      width: window.innerWidth
      height: window.innerHeight

  ignores_right_click: =>
    @svg.on 'contextmenu', -> d3.event.preventDefault()
  
  resizes_with_window: =>
    window.OnResize.push => @fills_the_whole_window()
