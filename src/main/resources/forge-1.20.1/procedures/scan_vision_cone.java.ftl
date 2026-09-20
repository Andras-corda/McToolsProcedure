((${input$viewer}).getLookAngle().dot(((${input$target}).position().subtract((${input$viewer}).getEyePosition())).normalize()) >= Math.cos(Math.toRadians((${input$fov_degrees}) / 2.0)))
