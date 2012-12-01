class Todoback.Models.Todo extends Backbone.Model
  paramRoot: 'todo'

  defaults:
    title: null
    state: "active"

  complete: ->
    console.log("completed")
    this.set("state", "completed")
    this.save()

  uncomplete: ->
    console.log("active")
    this.set("state", "active")
    this.save()



class Todoback.Collections.TodosCollection extends Backbone.Collection
  model: Todoback.Models.Todo
  url: '/todos'
