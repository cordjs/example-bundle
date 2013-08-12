define [
  'cord!Widget'
  'fs'
  'pathUtils'
], (Widget, fs, pathUtils) ->

  class Compiler extends Widget

    @initialCtx:
      structure: null

    @params:
      name: 'compileWidget'

    compileWidget: (name) ->
      @ctx.setDeferred 'structure'
      require [
        "cord-w!#{ name }"
        'cord!widgetCompiler'
      ], (WidgetClass, widgetCompiler) =>

        widget = new WidgetClass
          compileMode: true
        widgetCompiler.reset widget
        widget.compileTemplate (err, output) =>
          if err then throw err

          # todo: detect bundles or vendor dir correctly
          console.log "PUBLIC_PREFIX == #{ pathUtils.getPublicPrefix() }"
          tmplFullPath = "./#{ pathUtils.getPublicPrefix() }/bundles/#{ widget.getTemplatePath() }.structure.json"
          fs.writeFile tmplFullPath, widgetCompiler.getStructureCode(false), (err)->
            if err then throw err
            console.log "template saved #{ tmplFullPath }"

          widgetCompiler.printStructure()
          @ctx.setSingle 'structure', widgetCompiler.getStructureCode(false)
