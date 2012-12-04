define [
  'cord!Widget'
], (Widget) ->

  class AboutPage extends Widget

    @initialCtx:
      inlineMenuItem: 'aboutDavid'
      who: ''

    @params:
      someName: ':ctx.who'
