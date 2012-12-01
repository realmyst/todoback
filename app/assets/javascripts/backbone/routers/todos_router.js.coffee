class Todoback.Routers.TodosRouter extends Backbone.Router
  initialize: (options) ->
    @todos = new Todoback.Collections.TodosCollection()
    @todos.reset options.todos

  routes:
    "new"          : "newTodo"
    "index"        : "index"
    ":id/edit"     : "edit"
    ":id"          : "show"
    ".*"           : "index"
    ":id/complete" : "complete"

  newTodo: ->
    @view = new Todoback.Views.Todos.NewView(collection: @todos)
    $("#todos").html(@view.render().el)

  index: ->
    @view = new Todoback.Views.Todos.IndexView(todos: @todos)
    $("#todos").html(@view.render().el)

  complete: ->


  show: (id) ->
    todo = @todos.get(id)

    @view = new Todoback.Views.Todos.ShowView(model: todo)
    $("#todos").html(@view.render().el)

  edit: (id) ->
    todo = @todos.get(id)

    @view = new Todoback.Views.Todos.EditView(model: todo)
    $("#todos").html(@view.render().el)
