define [
  'cord!Behaviour'
], (Behaviour) ->

  class WidgetStructureExampleBehaviour extends Behaviour

    widgetEvents:
      'age': 'onAgeChange'
      'p1counter': 'onCounterChange'
      'activeTab': 'onActiveTabChange'

    onAgeChange: (data) ->
      @$('.j-age').html(data.value)

    onCounterChange: (data) ->
      @$('.j-counter').html(data.value)

    onActiveTabChange: (data) ->
      @$('.nav-tabs .active').removeClass 'active'
      @$("##{ @id }-#{ data.value}").addClass 'active'
