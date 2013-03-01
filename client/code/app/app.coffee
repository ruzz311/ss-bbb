require "/backbone.layoutmanager"

app = {}

# Configure LayoutManager. Use the default ss.tmpl on fetch and
# replace backslashes('/') with dashes('-').
Backbone.LayoutManager.configure
  manage: true
  prefix: ""
  fetch: (path)->
    return ss.tmpl[path.replace('/', '-')]

# Backbone.Events, module object, & layoutmanager into the app object.
module.exports =  _.extend app,
  
  # The root path to run the application.
  root: "/"
  
  # Base object used for every module
  module: (additionalProps)-> 
    _.extend(Views: {}, additionalProps)
  
  # Helper for using layouts.
  useLayout: (options)->
    layout = new Backbone.Layout _.extend(el: "body", options)
    return @layout = layout;
        
, Backbone.Events
