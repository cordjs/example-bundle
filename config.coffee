define [], () ->
  routes:

    '/example/':
      widget: '//HomePage'

    '/example/pages/':
      widget: '//SampleSectionPage'

    '/example/pages/independent/':
      widget: '//IndependentPage'

    '/example/pages/list/':
      widget: '//pages/UserListPage'

    '/example/pages/list/addUser/':
      widget: '//AddUserInListPage'

    '/example/widgets/':
      widget: '//widgets/WidgetsSectionPage'

    '/example/widgets/dynamic/':
      widget: '//widgets/DynamicWidgetAddPage'

    '/example/widgets/structure/':
      widget: '//widgets/WidgetStructurePage'
      params:
        p1: null
        p2: null

    '/example/widgets/structure/tab1':
      widget: '//widgets/WidgetStructurePage'
      params:
        p1: 'tab1a'
        p2: 'tab1b'

    '/example/widgets/structure/tab2':
      widget: '//widgets/WidgetStructurePage'
      params:
        p1: 'tab2a'

    '/example/widgets/structure/tab3':
      widget: '//widgets/WidgetStructurePage'
      params:
        p2: 'tab3b'

    '/example/widgets/timeout/':
      widget: '//widgets/TimeoutPlaceholderPage'

    '/example/widgets/event/':
      widget: '//widgets/EventExamplePage'

    '/example/about/:someName':
      widget: '//AboutPage'

    '/example/smartPage/:number/':
      widget: '//SmartPage'

    '/example/mainMenu':
      widget: '//MainMenu'

    '/compile':
      widget: '//Compiler'
