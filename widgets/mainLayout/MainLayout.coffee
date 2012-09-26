define [
  'cord!Widget'
], (Widget) ->

  class MainLayout extends Widget

    behaviourClass: false

    _defaultAction: (params, callback) ->
      today = new Date
      curYear = today.getFullYear()
      @ctx.set
        mainMenuItem: params.mainMenuItem
        currentYear: if curYear > 2012 then curYear else null
      callback()
