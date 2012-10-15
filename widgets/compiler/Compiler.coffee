define [
  'cord!Widget'
  'fs'
  'cord!configPaths'
], (Widget, fs, configPaths) ->

  class Compiler extends Widget

    _defaultAction: (params, callback) ->
      widgetName = params.name
      require [
        "cord-w!#{ widgetName }"
        'cord!widgetCompiler'
      ], (WidgetClass, widgetCompiler) =>

        widget = new WidgetClass
          compileMode: true
        widgetCompiler.reset widget
        widget.compileTemplate (err, output) =>
          if err then throw err

          # todo: detect bundles or vendor dir correctly
          console.log "PUBLIC_PREFIX == #{ configPaths.PUBLIC_PREFIX }"
          tmplFullPath = "./#{ configPaths.PUBLIC_PREFIX }/bundles/#{ widget.getTemplatePath() }.structure.json"
          fs.writeFile tmplFullPath, widgetCompiler.getStructureCode(false), (err)->
            if err then throw err
            console.log "template saved #{ tmplFullPath }"

          widgetCompiler.printStructure()
          @ctx.setSingle 'structure', widgetCompiler.getStructureCode(false)
          callback()
