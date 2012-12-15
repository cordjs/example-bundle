define [
  'cord!Widget'
], (Widget) ->

  class EventExamplePage extends Widget

    @initialCtx:
      buttonState: 'off'

    @childEvents:
      'my-button change.state': 'onToggleButtonStateChange'

    onToggleButtonStateChange: (newState) ->
      @ctx.set buttonState: newState
