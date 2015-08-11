define [
  'cord!vdom/Widget'
], (Widget) ->

  class VdomTestWidget extends Widget

    @inject: [
      'domPatcher'
      'vdomWidgetRepo'
      'widgetFactory'
      'widgetHierarchy'
    ]

    @css: true

    @initialState
      digit: 1
      inputClass: 'no-border'


    onRender: (calc) ->
      calc.digit = @state.digit * 100


    updateDigit: ->
      @setState digit: Math.random() * 10
      if @state.digit > 5
        @setState inputClass: 'input--with-border'
      else
        @setState inputClass: 'input--no-border'
