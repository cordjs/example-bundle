define [
  'cord!Behaviour'
  'jquery'
], (Behaviour, $) ->

  class MainMenuBehaviour extends Behaviour

    widgetEvents:
      'activeItem': 'onActiveItemChange'

    onActiveItemChange: (data) =>
      @$('.active').removeClass 'active'
      $("##{ @id }-#{ data.value }").addClass 'active'
