define [
  'cord!Behaviour'
], (Behaviour) ->

  class VdomSandboxBehaviour extends Behaviour

    @events:
      'click .j-update-button': ->
        @widget.childByName.vdomTest.updateDigit()
