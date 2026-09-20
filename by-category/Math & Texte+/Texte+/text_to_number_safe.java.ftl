(new Object(){
    double parse(String s, double def) {
        try { return Double.parseDouble(s.trim()); } catch (Exception e) { return def; }
    }
}.parse(String.valueOf(${input$text}), ${input$default_value}))
