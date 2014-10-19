define [
  'cord!Widget'
  'cord!utils/Future'
  'virtual-dom-stringify'
], (Widget, Future, stringify) ->

  class VdomTestWidget extends Widget

    behaviourClass: false


    show: ->
      vdomTmplFile = "bundles/#{ @getDir() }/#{ @constructor.dirName }.vdom"
      Future.require(vdomTmplFile).then (renderFn) ->
        renderFn().map (vtree) ->
          stringify(vtree)
        .join('')
