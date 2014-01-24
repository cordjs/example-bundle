define [
  'cord!Widget'
], (Widget) ->

  class DelayedList extends Widget

    @initialCtx:
      items: []
      delayForButton: ':deferred'

    @params:
      list: (items) ->
        @ctx.set items: items
        setTimeout =>
          @ctx.set delayForButton: 0
        , 3000
