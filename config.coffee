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

    '/example/pages/list/addUser/':
      widget: '//AddUserInListPage'

    '/example/widgets/':
      widget: '//widgets/WidgetsSectionPage'

    '/example/widgets/dynamic/':
      widget: '//widgets/DynamicWidgetAddPage'

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
