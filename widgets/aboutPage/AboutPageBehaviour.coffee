define [
  'cord!Behaviour'
], (Behaviour) ->

  class AboutPageBehaviour extends Behaviour

    widgetEvents:
      'who': 'onWhoChange'

    onWhoChange: (data) =>
      @renderInline 'content'
