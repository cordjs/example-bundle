define [
  'cord!Widget'
], (Widget) ->

  class InfiniteScrollListItem extends Widget

    cssClass: 'b-infinite-scroll-list-item'
    css: true

    @params:
      number: (number) ->
        @ctx.setDeferred 'number'
        setTimeout =>
          @ctx.set
            number: number
        , 100
