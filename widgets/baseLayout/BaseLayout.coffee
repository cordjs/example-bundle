define [
  'cord!Widget'
], (Widget) ->

  class BaseLayout extends Widget

    @initialCtx:
      pageTitle: 'Change Me'

    @params:
      title: ':ctx.pageTitle'
