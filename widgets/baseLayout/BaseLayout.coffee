define [
  'cord!Widget'
], (Widget) ->

  class BaseLayout extends Widget

    _defaultAction: (params, callback) ->
      @ctx.setSingle 'pageTitle', params.title
      callback()