define [], () ->
  routes:

    '/example/':
      widget: '//HomePage'

    '/example/pages/':
      widget: '//SampleSectionPage'

    '/example/pages/independent/':
      widget: '//IndependentPage'

    '/example/pages/list/':
      widget: '//UserListPage'

    '/example/about/:someName':
      widget: '//AboutPage'
      params:
        characterName: ':someName'

    '/example/smartPage/:number/':
      widget: '//SmartPage'

    '/example/mainMenu':
      widget: '//MainMenu'

    '/compile':
      widget: '//Compiler'
