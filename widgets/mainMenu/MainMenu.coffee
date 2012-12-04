define [
  'cord!Widget'
], (Widget) ->

  class MainMenu extends Widget

    cssClass: "navbar navbar-inverse"

    @initialCtx:
      activeItem: null

    @params:
      selectedItem: ':ctx.activeItem'
      position: (position) ->
        @cssClass += ' navbar-fixed-top' if position == 'top'
