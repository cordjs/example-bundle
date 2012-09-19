define [
  'cord!Widget'
  'fs'
  'cord!config'
], (Widget, fs, config) ->

  class Compiler extends Widget

    _defaultAction: (params, callback) ->
      widgetName = params.name
      console.log widgetName
      require [
        "cord-w!#{ widgetName }"
        "cord-helper!#{ widgetName }"
        'cord!widgetCompiler'
      ], (WidgetClass, widgetPath, widgetCompiler) =>

        widget = new WidgetClass true
        widget.setPath widgetPath
        widgetCompiler.reset widget
        widget.compileTemplate (err, output) =>
          if err then throw err

          tmplFullPath = "./#{ config.PUBLIC_PREFIX }/#{ widget.getTemplatePath() }.structure.json"
          fs.writeFile tmplFullPath, widgetCompiler.getStructureCode(false), (err)->
            if err then throw err
            console.log "template saved #{ tmplFullPath }"

          widgetCompiler.printStructure()
          @ctx.setSingle 'structure', widgetCompiler.getStructureCode(false)
          callback()
