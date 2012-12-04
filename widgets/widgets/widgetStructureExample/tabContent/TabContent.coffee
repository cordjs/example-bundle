define [
  'cord!Widget'
], (Widget) ->

  class TabContent extends Widget

    _initialCtx:
      text: 'change me'
      param1: ''
      param2: ''

    @params:
      text: ':ctx'
      p1: ':ctx.param1'
      p2: set: 'param2'
