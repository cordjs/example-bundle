define [
  'cord!Widget'
], (Widget) ->

  class UserListPage extends Widget

    _defaultAction: (params, callback) ->

      @ctx.setDeferred 'users'

      setTimeout =>
        @ctx.setSingle 'users', [
          name: 'John Smith'
          age: 25
        ,
          name: 'Mr. White'
          age: 30
        ,
          name: 'Alex Galchenkov'
          age: 30
        ]
      , 200

      callback()
