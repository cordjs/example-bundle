define [
  'cord!Widget'
], (Widget) ->

  class SmartPage extends Widget

    behaviourClass: false

    _defaultAction: (params, callback) ->
      @ctx.set
        number: params.number
      callback()
