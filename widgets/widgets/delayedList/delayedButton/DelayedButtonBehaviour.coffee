define [
  'cord!Behaviour'
], (Behaviour) ->

  class DelayedButtonBehaviour extends Behaviour

    @events:
      'click button': (e) ->
        alert(e.target.innerHTML)
        e.stopPropagation()
