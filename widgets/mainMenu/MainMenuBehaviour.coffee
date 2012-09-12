define [
  'cord!Behaviour'
  'jquery'
], (Behaviour, $) ->

  class MainMenuBehaviour extends Behaviour

    widgetEvents:
      'activeItem': 'onActiveItemChange'

    onActiveItemChange: (data) =>
      @$('.active').removeClass 'active'
      $("##{ data.value }").addClass 'active'
