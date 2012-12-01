Todoback.Views.Todos ||= {}

class Todoback.Views.Todos.IndexView extends Backbone.View
  template: JST["backbone/templates/todos/index"]

  initialize: () ->
    @options.todos.bind('reset', @addAll)
    @options.todos.bind('change', @render)

  addAll: () =>
    @options.todos.each(@addOne)

  addOne: (todo) =>
    view = new Todoback.Views.Todos.TodoView({model : todo})

    @$("table#todos-table").append(view.render().el)

  render: =>
    $(@el).html(@template(todos: @options.todos.toJSON() ))
    @addAll()

    @add_new_view = new Todoback.Views.Todos.NewView(collection: @options.todos)
    $("#new_todo").html(@add_new_view.render().el)

    return this
