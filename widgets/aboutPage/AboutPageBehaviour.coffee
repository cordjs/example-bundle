define [
  'cord!Behaviour'
], (Behaviour) ->

  class AboutPageBehaviour extends Behaviour

    widgetEvents:
      'who': 'onWhoChange'

    events:
      'click ##button': ->
        alert("Button click works!")
      'click ##button1': ->
        alert("2")

    onWhoChange: (data) =>
      @renderInline 'content'
