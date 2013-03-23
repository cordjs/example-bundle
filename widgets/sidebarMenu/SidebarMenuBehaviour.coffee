define [
  'cord!Behaviour'
], (Behaviour) ->

  class SidebarMenuBehaviour extends Behaviour

    widgetEvents:
      activeItem: 'onActiveItemChange'
      sections: 'render'

    onActiveItemChange: (data) ->
      @$('.active').removeClass 'active'
      @$("##{ @id }-#{ data.value}").addClass 'active'
