define [], () ->
  routes:

    '/example/':
      widget: '//HomePage'

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
