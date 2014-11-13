define [
  'cord!Widget'
  'cord!Utils'
  'cord!utils/Future'
  'cord!vdom/vstringify/stringify'
  'cord!vdom/vtree/diff'
  'underscore'
], (Widget, Utils, Future, stringify, diff, _) ->

  class VdomTestWidget extends Widget

    behaviourClass: false

    @initialState: (state) ->
      @_initialState ?= {}
      @_initialState = _.extend {}, @_initialState, state


    @initialState
      digit: 0


    show: ->
      @ctx.state = @state = Utils.cloneLevel2(@constructor._initialState)
      @_renderVtree().then (vtree) ->
        stringify(vtree)
      .failAloud()


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
      @_renderVtree().then (newVtree) ->
        console.log "render", newVtree
        patches = diff(@_vtree, newVtree)
        patch(@_rootElement, patches)


    _renderVtree: ->
      vdomTmplFile = "bundles/#{ @getDir() }/#{ @constructor.dirName }.vdom"

      calc = {}
      @onRender?(calc)
      props =
        id: 'w' + @ctx.id.split('-')[1]

      Future.require(vdomTmplFile).then (renderFn) ->
        renderFn(props, @state, calc)


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
      console.log "updateDigit"
      @setState digit: Math.random() * 10
