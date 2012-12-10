define [
  'cord!Widget'
], (Widget) ->

  class TimeoutPlaceholderPage extends Widget

    behaviourClass: false

    @initialCtx:
      list: []

    onShow: ->
      @ctx.setDeferred 'list'

      setTimeout =>
        @ctx.set list: [
          id: 1
          name: 'Preved'
        ,
          id: 2
          name: 'Medved'
        ]
      , 2000

