define [
  'cord!Widget'
], (Widget) ->

  class DelayedList extends Widget

    @initialCtx:
      items: []
      delayForButton1: ':deferred'
      delayForButton2: ':deferred'

    @params:
      list: (items) ->
        @ctx.set items: items
        setTimeout =>
          @ctx.set delayForButton1: Math.ceil(Math.random() * 1000000 % 1500)
          @ctx.set delayForButton2: Math.ceil(Math.random() * 1000000 % 3000)
        , Math.ceil(Math.random() * 1000000 % 3000)
