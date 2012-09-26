define [
  'cord!Widget'
], (Widget) ->

  class SampleSectionLayout extends Widget
    behaviourClass: false

    _defaultAction: (params, callback) ->
      @ctx.set
        menuItems: [
          name: 'Navigate'
          items: [
            id: 'sectionHome'
            name: 'Section Home'
            url: '/example/pages/'
          ]
        ,
          name: 'Pages'
          items: [
            id: 'independent'
            name: 'Independent Page'
            url: '/example/pages/independent/'
          ,
            id: 'list'
            name: 'User List'
            url: '/example/pages/list/'
          ,
            id: 'form'
            name: 'Add User Form'
            url: '/example/pages/form/'
          ]
        ]
        leftMenuItem: params.leftMenuItem

      callback()
