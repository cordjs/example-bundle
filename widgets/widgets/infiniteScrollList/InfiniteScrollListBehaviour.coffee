define [
  'cord!Behaviour'
  'underscore'
], (Behaviour, _) ->

  class InfiniteScrollListBehaviour extends Behaviour

    @events:
      'init': 'onInit'

    @widgetEvents:
      'items': 'onItemsChange'

    @elements:
      'div.scroll': '$scrollBox'


    onInit: ->
      @$scrollBox.scroll (evt) =>
        @onScroll(evt)
      @fillScrollArea()


    fillScrollArea: ->
      bottomY = @el.find('.b-infinite-scroll-list-item:last').position().top
      height = @el.height()
      scrollHeight = @$scrollBox.prop('scrollHeight')

      if scrollHeight <= height and bottomY < height + 100
        @widget.addItem()


    onItemsChange: (data) ->
      add = _.difference(data.value, data.oldValue)

      for info in add
        do (info) =>
          #@widget.createChildWidget '//widgets/InfiniteScrollListItem', (newItem) =>
          #  @renderNewWidget newItem, number: info.number, ($el) =>
          @initChildWidget '//widgets/InfiniteScrollListItem', number: info.number, ($el) =>
            if parseInt(Math.random() * 100 % 2) == 0
              $el.appendTo @$scrollBox
            else
              $el.prependTo @$scrollBox
            @fillScrollArea()


    onScroll: (e) ->
      scrollTop = @$scrollBox.scrollTop()
      height = @el.height()
      scrollHeight = @$scrollBox.prop('scrollHeight')
      if height + scrollTop > scrollHeight
        @widget.addItem()

