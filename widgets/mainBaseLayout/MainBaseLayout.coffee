define [
  'cord!Widget'
], (Widget) ->

  class MainBaseLayout extends Widget

    behaviourClass: false

    @initialCtx:
      pageTitle: 'Change Me'
      mainMenuItem: null

    @params:
      pageTitle: ':ctx'
      mainMenuItem: ':ctx'

