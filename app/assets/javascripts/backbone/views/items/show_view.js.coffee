Todoback.Views.Items ||= {}

class Todoback.Views.Items.ShowView extends Backbone.View
  template: JST["backbone/templates/items/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
