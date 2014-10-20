class RadioApp
  constructor: (url, svg_selector)->
    @load_stations url, (stations)=>

      player = new Player stations

      container = new SVG svg_selector
      d3 = new D3 container, stations

      d3.chosen = (name)-> player.play name
      d3.width = -> window.innerWidth
      d3.height = -> window.innerHeight
      d3.run()

  load_stations: (url, call)=>
    d3.json url, (error, data)=> call data


new RadioApp 'stations.json', 'svg'
