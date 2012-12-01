class Todoback.Routers.ItemsRouter extends Backbone.Router
  initialize: (options) ->
    @items = new Todoback.Collections.ItemsCollection()
    @items.reset options.items

  routes:
    "new"      : "newList::Item"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newList::Item: ->
    @view = new Todoback.Views.Items.NewView(collection: @items)
    $("#items").html(@view.render().el)

  index: ->
    @view = new Todoback.Views.Items.IndexView(items: @items)
    $("#items").html(@view.render().el)

  show: (id) ->
    item = @items.get(id)

    @view = new Todoback.Views.Items.ShowView(model: item)
    $("#items").html(@view.render().el)

  edit: (id) ->
    item = @items.get(id)

    @view = new Todoback.Views.Items.EditView(model: item)
    $("#items").html(@view.render().el)
