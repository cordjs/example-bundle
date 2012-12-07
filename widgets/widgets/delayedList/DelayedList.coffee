define [
  'cord!Widget'
], (Widget) ->

  class DelayedList extends Widget

    behaviourClass: false

    @initialCtx:
      items: []

    @params:
      list: ':ctx.items'
