class Todoback.Models.List::Item extends Backbone.Model
  paramRoot: 'list_item'

  defaults:
    title: null
    state: null

class Todoback.Collections.ItemsCollection extends Backbone.Collection
  model: Todoback.Models.List::Item
  url: '/list/items'
