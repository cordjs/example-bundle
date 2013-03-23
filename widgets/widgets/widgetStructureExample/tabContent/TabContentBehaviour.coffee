define [
  'cord!Behaviour'
], (Behaviour) ->

  class TabContentBehaviour extends Behaviour

    widgetEvents:
      text: 'render'
      param1: 'render'
      param2: 'render'
