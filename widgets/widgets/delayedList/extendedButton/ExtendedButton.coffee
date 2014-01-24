define [
  'cord-w!/cord/example//widgets/delayedList/DelayedButton'
], (DelayedButton) ->

  class ExtendedButton extends DelayedButton

    behaviourClass: false

    @initialCtx:
      threshold: ':deferred'

    @params:
      delay: (timeout) ->
        setTimeout =>
          @ctx.set threshold: timeout
        , timeout
