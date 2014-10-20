require 'rack-livereload'
 
use Rack::LiveReload
use Rack::Static,
  urls: [""],
  root: 'public',
  index: 'index.html'
 
run proc { }
