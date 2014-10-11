define [
  'cord!Behaviour'
], (Behaviour) ->

  class ToggleButtonBehaviour extends Behaviour

    widgetEvents:
      pressed: (data) ->
        @toggleClass('active btn-success', data.value)

    events:
      'click': ->
        @widget.toggleState()
