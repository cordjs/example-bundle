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
      'widgetFactory'
      'vdomWidgetRepo'
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
      @state = @ctx.state if not @state
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
        rootElement = document.getElementById('w' + @ctx.id.split('-')[1])
        patch(rootElement, patches, @vdomWidgetRepo)
        @_vtree = newVtree
      .failAloud()


    _renderVtree: ->
      ###
      Renders the widget's template to the virtual DOM tree, using current state and props
      @return {Promise.<VNode>}
      ###
      vdomTmplFile = "bundles/#{ @getDir() }/#{ @constructor.dirName }.vdom"

      calc = {}
      @onRender?(calc)
      props =
        id: 'w' + @ctx.id.split('-')[1]

      Future.require(vdomTmplFile).then (renderFn) =>
        renderFn(props, @state, calc)


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
      @widgetFactory.create(vwidget.type, vwidget.properties, vwidget.slotNodes, @getBundle()).then (widget) ->
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


    updateDigit: ->
      @setState digit: Math.random() * 10
      if @state.digit > 5
        @setState inputClass: 'with-border'
      else
        @setState inputClass: 'no-border'
