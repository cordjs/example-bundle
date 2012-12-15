define [
  'cord!Widget'
], (Widget) ->

  class WidgetsSectionLayout extends Widget
    behaviourClass: false

    @params:
      leftMenuItem: ':ctx'

    @initialCtx:
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
          id: 'structure'
          name: 'Widget Structure Example'
          url: '/example/widgets/structure/'
        ,
          id: 'timeout'
          name: 'Timeout Placeholder Example'
          url: '/example/widgets/timeout/'
        ,
          id: 'event'
          name: 'Event Example'
          url: '/example/widgets/event/'
        ]
      ]
      leftMenuItem: null
