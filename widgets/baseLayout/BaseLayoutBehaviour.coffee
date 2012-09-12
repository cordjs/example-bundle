define [
  'cord!Behaviour'
], (Behaviour) ->

  class BaseLayoutBehaviour extends Behaviour

    widgetEvents:
      'pageTitle': 'onTitleChange'

    onTitleChange: (data) =>
      document.title = data.value
