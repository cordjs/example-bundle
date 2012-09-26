define [
  'cord!Widget'
], (Widget) ->

  class SidebarMenu extends Widget

    _defaultAction: (params, callback) ->
      @ctx.set
        sections: params.sections
        activeItem: params.selectedItem
      callback()
