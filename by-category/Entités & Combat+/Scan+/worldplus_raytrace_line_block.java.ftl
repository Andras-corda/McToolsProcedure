/*@BlockState*/(((${input$entity}).level().clip(new ClipContext(new Vec3(${input$x1}, ${input$y1}, ${input$z1}), new Vec3(${input$x2}, ${input$y2}, ${input$z2}), ClipContext.Block.OUTLINE, ClipContext.Fluid.NONE, ${input$entity})).getType() == HitResult.Type.BLOCK)
    ? (${input$entity}).level().getBlockState(((BlockHitResult) (${input$entity}).level().clip(new ClipContext(new Vec3(${input$x1}, ${input$y1}, ${input$z1}), new Vec3(${input$x2}, ${input$y2}, ${input$z2}), ClipContext.Block.OUTLINE, ClipContext.Fluid.NONE, ${input$entity})).getBlockPos())
    : Blocks.AIR.defaultBlockState())
