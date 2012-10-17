define [
  'cord!Widget'
], (Widget) ->

  class MainMenu extends Widget

    cssClass: "navbar navbar-inverse"

    _defaultAction: (params, callback) ->
      @ctx.set
        activeItem: params.selectedItem
      @cssClass += ' navbar-fixed-top' if params.position == 'top'

      callback()
