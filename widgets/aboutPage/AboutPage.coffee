define [
  'cord!Widget'
], (Widget) ->

  class AboutPage extends Widget

    _defaultAction: (params, callback) ->
      @ctx.set
        who: params.someName
        inlineMenuItem: 'aboutDavid'
#      @ctx.setSingle 'who', params.characterName
      callback()
