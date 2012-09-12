define [], () ->
  routes:

    '/example/about/:someName':
      widget: '//aboutPage'
      params:
        characterName: ':someName'
