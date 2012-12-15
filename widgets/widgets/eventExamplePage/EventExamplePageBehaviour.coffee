define [
  'cord!Behaviour'
], (Behaviour) ->

  class EventExamplePageBehaviour extends Behaviour

    @elements:
      '.j-state': '$stateBadge'

    @widgetEvents:
      buttonState: (data) ->
        @$stateBadge.html data.value
        @setupStateBadgeClass()

    @events:
      init: 'setupStateBadgeClass'


    setupStateBadgeClass: ->
      if @widget.ctx.buttonState == 'on'
        @$stateBadge.removeClass 'badge-important'
        @$stateBadge.addClass 'badge-success'
      else
        @$stateBadge.removeClass 'badge-success'
        @$stateBadge.addClass 'badge-important'
