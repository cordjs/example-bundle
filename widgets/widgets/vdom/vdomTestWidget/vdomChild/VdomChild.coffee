define [
  'cord!vdom/Widget'
], (Widget) ->

  class VdomChild extends Widget

    onRender: (calc) ->
      calc.showWidget = (Math.round(@props.testProp) % 11 != 0)
      calc.digit = Math.round(Math.random() * 100)
