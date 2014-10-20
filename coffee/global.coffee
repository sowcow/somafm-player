
# global saner OnResize
window.OnResize = []
window.onresize = -> call() for call in OnResize

# global shorter "debugger"
window.P = (x)-> console.log x

# other outer global stuff
# pile of stuff used
window.Pile = {
  shuffle: `function (o){ for(var j, x, i = o.length; i; j = Math.floor(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x); return o; }`
}
