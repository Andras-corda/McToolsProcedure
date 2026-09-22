if ((${opt.toInt(input$index)}) >= 0 && (${opt.toInt(input$index)}) < ((java.util.List<Object>) ${input$list}).size()) {
    ((java.util.List<Object>) ${input$list}).set(${opt.toInt(input$index)}, ${input$value});
}
