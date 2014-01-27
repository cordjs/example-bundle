define [
  'cord!Widget'
], (Widget) ->

  class DelayedButton extends Widget

    @initialCtx:
      threshold: ':deferred'

    @params:
      delay: (timeout) ->
        setTimeout =>
          @ctx.set threshold: timeout
        , timeout
