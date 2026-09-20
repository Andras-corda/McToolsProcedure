if ((${input$entity}) instanceof Mob _afoMob) {
    _afoMob.getNavigation().moveTo((${input$target}).getX(), (${input$target}).getY(), (${input$target}).getZ(), ${input$speed});
}
