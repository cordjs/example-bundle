define [
  'cord!Widget'
  'cord!utils/Future'
  'cord!vdom/vstringify/stringify'
], (Widget, Future, stringify) ->

  class VdomTestWidget extends Widget

    behaviourClass: false


    show: ->
      vdomTmplFile = "bundles/#{ @getDir() }/#{ @constructor.dirName }.vdom"

      calc = {}
      @onRender?(calc)

      Future.require(vdomTmplFile).then (renderFn) ->
        renderFn(null, null, calc).map (vtree) ->
          stringify(vtree)
        .join('')


    onRender: (calc) ->
      calc.digit = 36.7
