define [
  'cord!vdom/Widget'
  'cord!utils/Future'
], (Widget, Promise) ->

  class VdomChild extends Widget

    @initialState
      asyncVal: ->
        Promise.timeout(100).then -> '111 async-after-timeout 222'


    onRender: (calc) ->
      calc.showWidget = (Math.round(@props.testProp) % 11 != 0)
      calc.digit = Math.round(Math.random() * 100)
