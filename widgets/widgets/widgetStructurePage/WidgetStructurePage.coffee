define [
  'cord!Widget'
], (Widget) ->

  class WidgetStructurePage extends Widget

    behaviourClass: false

    @initialCtx:
      rand: -> parseInt(Math.random() * 10000 % 100)
      p1: null
      p2: null

    @params:
      p1: ':ctx'
      p2: ':ctx'

#    init: ->
#      @ctx.set
#        rand: Math.random() * 10000 % 100
