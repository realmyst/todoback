Todoback.Views.Todos ||= {}

class Todoback.Views.Todos.TodoView extends Backbone.View
  template: JST["backbone/templates/todos/todo"]

  events:
    "click .destroy" : "destroy"
    "click .title" : "show"
    "click .active" : "complete"
    "click .completed" : "uncomplete"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  show: () ->
    window.location.hash = "/#{@model.id}"

  complete: ->
    @model.complete()
    this.render()

  uncomplete: ->
    @model.uncomplete()
    this.render()

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    return this
