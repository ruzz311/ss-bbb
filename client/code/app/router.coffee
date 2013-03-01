app = require "/app"
Example = require "/modules/example"

# Defining the application router, you can attach sub routers here.
module.exports = Router = Backbone.Router.extend

  routes:
    "" : "index"
    
  index: ->
    collection = new Example.Collection()
    
    app.useLayout().setViews
      "#main .row1": [
        new Example.Views.Column(collection: collection)
        new Example.Views.Column(collection: collection)
        new Example.Views.Column(collection: collection)
      ]
      "#main .row2": [
        new Example.Views.Column(collection: collection, className:"span12")
      ]
      
    app.layout.render()
    
    ss.rpc "demo.readAll", (err, res)->
      if err then console.error(err)
      collection.reset(res)
    
    return true

