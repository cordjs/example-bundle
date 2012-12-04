define [
  'cord!Widget'
], (Widget) ->

  class InfiniteScrollList extends Widget

    cssClass: 'b-infinite-scroll-list'
    css: true
    counter: 1

    @initialCtx:
      items: [
        number: 1
      ]


    addItem: ->
      @counter++
      newItems = _.clone @ctx.items # to give ability to compare old and new value (for the behaviour)
      newItems.push number: @counter
      @ctx.set items: newItems
