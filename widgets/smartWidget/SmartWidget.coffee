define [
  'cord!Widget'
], (Widget) ->

  class SmartWidget extends Widget

    behaviourClass: false

    _defaultAction: (params, callback) ->
      @ctx.set
        who: params.who
      callback()
