define [
  'cord!Widget'
], (Widget) ->

  class MainMenu extends Widget

    _defaultAction: (params, callback) ->
      @ctx.set
        activeItem: params.selectedItem
        position: params.position
      callback()
