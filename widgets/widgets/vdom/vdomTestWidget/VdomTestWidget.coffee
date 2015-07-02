define [
  'cord!Widget'
  'cord!Utils'
  'cord!utils/Future'
  'cord!vdom/vstringify/stringify'
  'cord!vdom/vtree/diff'
  'cord!vdom/vtree/vtree'
  'cord!vdom/vpatch/createElement'
  'cord!vdom/vpatch/patch'
  'underscore'
], (Widget, Utils, Future, stringify, diff, vtree, createElement, patch, _) ->

  class VdomTestWidget extends Widget

    @inject: [
      'vdomWidgetRepo'
      'widgetFactory'
      'widgetHierarchy'
    ]

    behaviourClass: false
    css: true
    cssClass: 'vdom-test'

    @initialState: (state) ->
      @_initialState ?= {}
      @_initialState = _.extend {}, @_initialState, state


    @initialState
      digit: 1
      inputClass: 'no-border'


    show: ->
      @id = (if CORD_IS_BROWSER then 'b' else 'n') + @ctx.id.split('-')[1]  if not @id
      @ctx.state = @state = Utils.cloneLevel2(@constructor._initialState)
      (if CORD_IS_BROWSER
        @renderDeepTree().then (vtree) =>
          el = createElement(vtree)
          @_waitShimRoot().then (shimEl) ->
            shimEl.appendChild(el)
          ''
      else
        @renderDeepTree().then (vtree) ->
          stringify(vtree)
      ).failAloud()


    _waitShimRoot: ->
      @_shimPromise = Future.single()


    browserInit: (stopPropagateWidget, $domRoot) ->
      if stopPropagateWidget? and not (stopPropagateWidget instanceof Widget)
        $domRoot = stopPropagateWidget
        stopPropagateWidget = undefined

      target = $domRoot.find('#' + @ctx.id)
      if target.size() == 1
        @_shimPromise.resolve(target[0])
      else
        @_shimPromise.reject(new Error("Invalid root element #{target}"))


    initBehaviour: ->
      # dirty hack to restore state came from the server
      if not @state
        @id = 'n' + @ctx.id.split('-')[1]
        @state = @ctx.state
      Future.resolved()


    onRender: (calc) ->
      calc.digit = @state.digit * 100


    setState: (stateVars) ->
      @_restoreCurrentVtree().then =>
        changed = false
        for key, value of stateVars
          # TODO replace with more sophisticated logic from Context
          if @state[key] != value
            changed = true
            @state[key] = value
        @render() if changed


    render: ->
      @_renderVtree().then (newVtree) =>
        patches = diff(@_vtree, newVtree)
        rootElement = document.getElementById(@ctx.id.charAt(0) + @ctx.id.split('-')[1])
        patch rootElement, patches,
          widget: this
          widgetRepo: @vdomWidgetRepo
          widgetFactory: @widgetFactory
        .then =>
          @_vtree = newVtree
          return
      .failAloud()


    _renderVtree: ->
      ###
      Renders the widget's template to the virtual DOM tree, using current state and props
      @return {Promise.<VNode>}
      ###
      vdomTmplFile = "bundles/#{ @getDir() }/#{ @constructor.dirName }.vdom"

      calc = {}
      @onRender?(calc)

      Future.require(vdomTmplFile).then (renderFn) =>
        vnode = renderFn({}, @state, calc)
        vnode.properties.id = @id
        vnode


    renderDeepTree: ->
      ###
      Renders the widget with dereferencing child widgets (rendering them to the simple VNodes) deeply.
      @return {Promise.<VNode>}
      ###
      @_renderVtree().then (vnode) =>
        @_recDereferenceTree(vnode)


    _recDereferenceTree: (vnode) ->
      ###
      Recursively scans the given VNode and replaces VWidget occurences with the rendered widget VNode
      @param {VNode} vnode
      @return {Promise.<VNode>}
      ###
      if vtree.isWidget(vnode)
        @_renderDeepVWidget(vnode)
      else if vtree.isVNode(vnode)
        promises = (@_recDereferenceTree(child) for child in vnode.children)
        Future.all(promises).then (dereferencedChildren) ->
          vnode.children = dereferencedChildren
          vnode
      else
        Future.resolved(vnode)


    _renderDeepVWidget: (vwidget) ->
      ###
      Renders (dereference) VWidget node and recursively dereference it's VTree.
      @param {VWidget} vwidget
      @return {Promise.<VNode>}
      ###
      @widgetFactory.create(vwidget.type, vwidget.properties, vwidget.slotNodes, this).then (widget) ->
        widget.renderDeepTree()


    _restoreCurrentVtree: ->
      ###
      @todo make this synchronous
      ###
      if not @_vtree
        @_renderVtree().then (vtree) =>
          @_vtree = vtree
      else
        Future.resolved(@_vtree)


    getInitCode: (parentId) ->
      ###
      Uses widgetHierarchy service as a child widgets source
      @override
      ###
      parentStr = if parentId? then ",'#{ parentId }'" else ''

      namedChilds = {}
      for name, widget of @childByName
        namedChilds[widget.ctx.id] = name

      serializedModelBindings = {}
      for key, mb of @_modelBindings
        serializedModelBindings[key] = mb.model.serializeLink()

      # filter bad unicode characters before sending data to browser
      ctxString = unescape(encodeURIComponent(JSON.stringify(@ctx))).replace(/[\\']/g, '\\$&').replace(/<\/script>/g, '<\\/script>')

      jsonParams = [namedChilds, @childBindings, serializedModelBindings]
      jsonParamsString = (jsonParams.map (x) -> JSON.stringify(x)).join(',')

      # indentation is mandatory to beautify page source formatting
      """
            wi.init('#{ @getPath() }','#{ ctxString }',#{ jsonParamsString },#{ @_isExtended }#{ parentStr });
      #{ (widget.getInitCode(@id) for widget in @widgetHierarchy.getChildren(this)).join('') }
      """


    updateDigit: ->
      @setState digit: Math.random() * 10
      if @state.digit > 5
        @setState inputClass: 'with-border'
      else
        @setState inputClass: 'no-border'
