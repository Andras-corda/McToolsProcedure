((int) world.getEntitiesOfClass(Entity.class, new AABB((${input$x}) - (${input$radius}), (${input$y}) - (${input$radius}), (${input$z}) - (${input$radius}), (${input$x}) + (${input$radius}), (${input$y}) + (${input$radius}), (${input$z}) + (${input$radius})))
    .stream()
    .filter(_sphE -> _sphE.position().distanceToSqr(${input$x}, ${input$y}, ${input$z}) <= (${input$radius}) * (${input$radius}))
    .count())
