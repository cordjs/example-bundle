define [
  'cord!Behaviour'
], (Behaviour) ->

  class DelayedListBehaviour extends Behaviour

    events:
      'click': ->
        alert("Urraaaa!")
