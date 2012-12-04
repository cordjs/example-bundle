define [
  'cord!Widget'
], (Widget) ->

  class SidebarMenu extends Widget

    @initialCtx:
      sections: []
      activeItem: null

    @params:
      sections: ':ctx'
      selectedItem: ':ctx.activeItem'
