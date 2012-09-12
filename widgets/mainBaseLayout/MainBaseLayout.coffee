define [
  'cord!Widget'
], (Widget) ->

  class MainBaseLayout extends Widget

    behaviourClass = false

    _defaultAction: (params, callback) ->
      @ctx.set
        pageTitle: params.pageTitle
        mainMenuItem: params.mainMenuItem
      callback()