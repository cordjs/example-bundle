define [
  'cord!Widget'
], (Widget) ->

  class MainLayout extends Widget

    behaviourClass: false

    @initialCtx:
      currentYear: ->
        today = new Date
        curYear = today.getFullYear()
        if curYear > 2012 then curYear else null
      mainMenuItem: null

    @params:
      mainMenuItem: ':ctx'
