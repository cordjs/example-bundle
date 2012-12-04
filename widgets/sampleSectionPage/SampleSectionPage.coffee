define [
  'cord!Widget'
], (Widget) ->

  class SampleSectionPage extends Widget
    behaviourClass: false

    @initialCtx:
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
