define [
  'cord!Widget'
], (Widget) ->

  class HomePage extends Widget

    behaviourClass: false
    css: true

    _defaultAction: (params, callback) ->

      callback()
