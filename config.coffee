define [], () ->
  routes:

    '/example/about/:someName':
      widget: '//aboutPage'
      params:
        characterName: ':someName'

    '/example/smartPage/:number/':
      widget: '//smartPage'

    '/example/mainMenu':
      widget: '//mainMenu'

    '/compile':
      widget: '//compiler'
