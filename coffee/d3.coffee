charge = -270
chosenCharge = -1000


class window.D3
  constructor: (svg, data)->
    @svg = svg.svg # unclothing early?
    @data = Pile.shuffle data # preprocessing

  run: =>
    # <d3 hairy stuff>
    force_nodes = @construct_force @data
    visual_nodes = @draw_nodes force_nodes

    @nodes = visual_nodes
    @force.on 'tick', @tick
    # </d3 stuff>

    window.OnResize.push => @update_force() # centering

    @nodes.call @force.drag # draggable nodes

    @nodes.on contextmenu: (d, i)=>
      @chosenIndex = i
      @update_force()
      @chosen d.name, i # outer method to be defined

  update_force: =>
    @force
      .size([
        @width()
        @height()
      ])
      .charge( (d, i)=>
        return charge unless @chosenIndex
        if i is @chosenIndex then chosenCharge else charge/2
      )
      .start()

  construct_force: (data)=>
    @force = d3.layout.force()
      .nodes(data)
      .friction(0.999)
    @update_force()
    @force.nodes()

  draw_nodes: (force_nodes)=>
    @svg.selectAll('.node')
      .data(force_nodes)
      .enter().append('circle')
      .attr(fill: (d) -> "url(##{d.name})" )
      .attr(r: 60)

  tick: =>
    @nodes
      .attr('cx', (d)-> d.x )
      .attr('cy', (d)-> d.y )
      .attr('r', (d,i)=>
        return 60 unless @chosenIndex
        if i is @chosenIndex then 60 else 40
      )
