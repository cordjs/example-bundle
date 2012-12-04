define [
  'cord!Widget'
], (Widget) ->

  class SmartWidget extends Widget

    behaviourClass: false

    @params:
      who: ':ctx'
