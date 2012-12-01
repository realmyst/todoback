class Todoback.Models.List extends Backbone.Model
  paramRoot: 'list'

  defaults:

class Todoback.Collections.ListsCollection extends Backbone.Collection
  model: Todoback.Models.List
  url: '/lists'
