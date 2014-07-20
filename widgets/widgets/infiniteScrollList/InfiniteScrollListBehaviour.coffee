define [
  'cord!Behaviour'
  'underscore'
], (Behaviour, _) ->

  class InfiniteScrollListBehaviour extends Behaviour

    @widgetEvents:
      'items': 'onItemsChange'

    @elements:
      'div.scroll': 'scrollBox'


    init: ->
      @scrollBox.scroll (evt) =>
        @onScroll(evt)
      @fillScrollArea()


    fillScrollArea: ->
      bottomY = @el.find('.b-infinite-scroll-list-item:last').position().top
      height = @el.height()
      scrollHeight = @scrollBox.prop('scrollHeight')

      if scrollHeight <= height and bottomY < height + 100
        @widget.addItem()


    onItemsChange: (data) ->
      add = _.difference(data.value, data.oldValue)

      for info in add
        do (info) =>
          @insertChildWidget '//widgets/InfiniteScrollListItem',
            number: info.number
            ':position': if parseInt(Math.random() * 100 % 2) then 'prepend' else 'append'
            ':context': @scrollBox
          .then =>
            @fillScrollArea()
          .failAloud()


    onScroll: ->
      scrollTop = @scrollBox.scrollTop()
      height = @el.height()
      scrollHeight = @scrollBox.prop('scrollHeight')
      if height + scrollTop > scrollHeight
        @widget.addItem()

