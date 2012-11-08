define [
  'cord!Widget'
], (Widget) ->

  class InfiniteScrollList extends Widget

    cssClass: 'b-infinite-scroll-list'
    css: true
    counter: 1


    _defaultAction: (params, callback) ->
      @ctx.set
        items: [
          number: 1
        ]
      callback()


    _addItemAction: (params, callback) ->
      @counter++
      newItems = _.clone @ctx.items # to give ability to compare old and new value (for the behaviour)
      newItems.push number: @counter
      @ctx.setSingle 'items', newItems
      callback()
