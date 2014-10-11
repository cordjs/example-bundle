define [
  'cord!Widget'
], (Widget) ->

  class EventExamplePage extends Widget

    @initialCtx:
      buttonState: 'off'

    @childEvents:
      'my-button change.state': 'onToggleButtonStateChange'
      'my-button super': (x) -> console.log "#{ @debug 'super event' }", x


    onToggleButtonStateChange: (newState) ->
      @ctx.set buttonState: newState
