define [
  'cord!Widget'
], (Widget) ->

  class UserListPage extends Widget
    behaviourClass: false

    _defaultAction: (params, callback) ->

      callback()
