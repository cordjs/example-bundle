define [
  'cord!Widget'
], (Widget) ->

  class UserListPage extends Widget

    @initialCtx:
      users: []
      menuItem: null


    onShow: ->
      @ctx.setDeferred 'users', 'menuItem'

      @ctx.set 'users', [
        name: 'John Smith'
        age: 25
      ,
        name: 'Mr. White'
        age: 30
      ,
        name: 'Alex Galchenkov'
        age: 30
      ]
      @ctx.set 'menuItem', 'list'
