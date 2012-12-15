define [
  'cord!Behaviour'
], (Behaviour) ->

  class ToggleButtonBehaviour extends Behaviour

    widgetEvents:
      pressed: (data) ->
        if data.value
          @$el.addClass 'active btn-success'
        else
          @$el.removeClass 'active btn-success'

    events:
      'click': ->
        @widget.toggleState()
