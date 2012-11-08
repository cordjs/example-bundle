define [
  'cord!Widget'
], (Widget) ->

  class WidgetsSectionLayout extends Widget
    behaviourClass: false

    _defaultAction: (params, callback) ->
      @ctx.set
        menuItems: [
          name: 'Navigate'
          items: [
            id: 'sectionHome'
            name: 'Section Home'
            url: '/example/widgets/'
          ]
        ,
          name: 'Pages'
          items: [
            id: 'dynamic'
            name: 'Dynamic Widget Add'
            url: '/example/widgets/dynamic/'
          ,
            id: 'another'
            name: 'Another Widget Example (fake)'
            url: '/example/widgets/another/'
          ]
        ]
        leftMenuItem: params.leftMenuItem

      callback()
