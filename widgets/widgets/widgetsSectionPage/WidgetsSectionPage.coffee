define [
  'cord!Widget'
], (Widget) ->

  class WidgetsSectionPage extends Widget
    behaviourClass: false

    _defaultAction: (params, callback) ->
      callback()
