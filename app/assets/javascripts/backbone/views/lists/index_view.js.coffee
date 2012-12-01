Todoback.Views.Lists ||= {}

class Todoback.Views.Lists.IndexView extends Backbone.View
  template: JST["backbone/templates/lists/index"]

  initialize: () ->
    @options.lists.bind('reset', @addAll)

  addAll: () =>
    @options.lists.each(@addOne)

  addOne: (list) =>
    view = new Todoback.Views.Lists.ListView({model : list})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(lists: @options.lists.toJSON() ))
    @addAll()

    return this
