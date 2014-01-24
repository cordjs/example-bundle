define [
  'cord!Widget'
], (Widget) ->

  class DelayedButton extends Widget

    behaviourClass: false

    @initialCtx:
      threshold: ':deferred'

    @params:
      delay: (timeout) ->
        setTimeout =>
          @ctx.set threshold: timeout
        , timeout
