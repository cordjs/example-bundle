define [
  'cord!Widget'
], (Widget) ->

  class SmartPage extends Widget

    behaviourClass: false

    @params:
      number: ':ctx'
