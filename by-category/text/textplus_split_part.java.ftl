<#assign _tpsParts = "String.valueOf(" + input$text + ").split(java.util.regex.Pattern.quote(String.valueOf(" + input$delimiter + ")), -1)">
((${opt.toInt(input$index)}) >= 0 && (${opt.toInt(input$index)}) < ${_tpsParts}.length ? ${_tpsParts}[${opt.toInt(input$index)}] : "")
