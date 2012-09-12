define [
  'cord!Widget'
], (Widget) ->

  class MainLayout extends Widget

    behaviourClass = false

    _defaultAction: (params, callback) ->
      @ctx.setSingle 'mainMenuItem', params.mainMenuItem
      callback()
