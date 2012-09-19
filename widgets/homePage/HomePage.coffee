define [
  'cord!Widget'
], (Widget) ->

  class HomePage extends Widget

    behaviourClass: false

    _defaultAction: (params, callback) ->

      callback()
