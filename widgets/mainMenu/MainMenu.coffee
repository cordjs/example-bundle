define [
  'cord!Widget'
], (Widget) ->

  class MainMenu extends Widget

    _defaultAction: (params, callback) ->
      @ctx.setSingle 'activeItem', params.selectedItem
      callback()
