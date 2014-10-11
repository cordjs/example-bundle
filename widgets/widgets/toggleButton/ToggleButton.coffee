define [
  'cord!Widget'
], (Widget) ->

  class ToggleButton extends Widget

    rootTag: 'button'
    cssClass: 'btn'

    @initialCtx:
      label: 'Button'
      pressed: false

    @params:
      label: ':ctx'
      state: (state) -> @ctx.set pressed: state == 'on'


    onShow: ->
      @addDynClass('active btn-success') if @ctx.pressed
      @emit 'super', @cssClass


    toggleState: ->
      @ctx.set pressed: not @ctx.pressed
      @emit 'change.state', if @ctx.pressed then 'on' else 'off'
