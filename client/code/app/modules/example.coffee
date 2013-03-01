app = require "/app"

# Create a new module object to export
module.exports = Example = app.module()

# ================================================= MODELS / COLLECTIONS

Example.Collection = Backbone.Collection.extend
  model: Backbone.Model

# =============================================================== VIEWS

# Example column view (acts as view-collection)
Example.Views.Column = Backbone.View.extend
  template: "example/column"
  className: "span4"
  
  initialize: ->
    @collection.on "reset", @render, @
  
  beforeRender: ->
    _.each @views, (view)->
      view.remove()
    @collection.each (model)=>
      @insertView new Example.Views.Content model: model

# Example content / item view
Example.Views.Content = Backbone.View.extend
  template: "example/content"
  className: "content fluid-row"
  tagName: "p"
  
  initialize: ->
    @model.on "change", @render, @
  
  serialize: -> 
    @model.toJSON()
