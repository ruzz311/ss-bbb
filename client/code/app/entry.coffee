# This file automatically gets called first by SocketStream and must always exist

# Make 'ss' available to all modules and the browser console
window.ss = require 'socketstream'
app = require '/app'
Router = require '/router'

ss.server.on 'disconnect', ->
  console.log('Connection down :-(')

ss.server.on 'reconnect', ->
  console.log('Connection back up :-)')

# server and dom ready
ss.server.on 'ready', ->
  
  jQuery ->
    
    # Init & start router.
    app.router = new Router()
    
    Backbone.history.start
      pushState: true
      root: app.root
