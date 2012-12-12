define [
  'cord!Widget'
], (Widget) ->

  class DelayedList extends Widget

    @initialCtx:
      items: []

    @params:
      list: ':ctx.items'
