((${input$entity}).level().clip(new ClipContext(new Vec3(${input$x}, ${input$y}, ${input$z}), new Vec3(${input$x}, (${input$y}) - (${input$max_distance}), ${input$z}), ClipContext.Block.OUTLINE, ClipContext.Fluid.NONE, ${input$entity})).getType() == HitResult.Type.BLOCK
    ? (${input$y}) - ((BlockHitResult) (${input$entity}).level().clip(new ClipContext(new Vec3(${input$x}, ${input$y}, ${input$z}), new Vec3(${input$x}, (${input$y}) - (${input$max_distance}), ${input$z}), ClipContext.Block.OUTLINE, ClipContext.Fluid.NONE, ${input$entity})).getLocation().y
    : (${input$max_distance}))
