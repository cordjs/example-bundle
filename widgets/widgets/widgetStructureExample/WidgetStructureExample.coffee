define [
  'cord!Widget'
], (Widget) ->

  class WidgetStructureExample extends Widget

    @initialCtx:
      activeTab: ''
      age: 0
      tabContentString: ''
      p1val: ''
      p2val: ''
      p1counter: 0

    @params:
      intParam:
        validate: ':int'
        set: 'age'

      requiredParam:
        required: true

      'p1, p2': 'onPairChange'

      p1: (pair1) ->
        @ctx.set p1counter: @ctx.p1counter + 1


    onPairChange: (pair1, pair2) ->
      if pair1? and pair2?
        @ctx.set
          tabContentString: 'Both are set'
          activeTab: 'first'
          p1val: pair1
          p2val: pair2
      else if pair1?
        @ctx.set
          tabContentString: 'Pair1 is set'
          activeTab: 'second'
          p1val: pair1
      else if pair2?
        @ctx.set
          tabContentString: 'Pair2 is set'
          activeTab: 'third'
          p2val: pair2
      else if pair1 == undefined and pair2 == undefined
        @ctx.set tabContentString: 'WARNING: this is impossible!'
      else
        @ctx.set
          tabContentString: 'None is set'
          activeTab: ''


