{
    BlockPos _flwTickPos = BlockPos.containing(${input$x}, ${input$y}, ${input$z});
    world.scheduleTick(_flwTickPos, world.getBlockState(_flwTickPos).getBlock(), ${opt.toInt(input$delay)});
}
