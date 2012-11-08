define [
  'cord!Widget'
], (Widget) ->

  class InfiniteScrollListItem extends Widget

    cssClass: 'b-infinite-scroll-list-item'
    css: true

    _defaultAction: (params, callback) ->
      @ctx.setDeferred 'number'
      setTimeout =>
        @ctx.set
          number: params.number
      , 100

      callback()
