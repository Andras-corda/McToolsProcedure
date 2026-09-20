{
    BlockPos _flwRedstonePos = BlockPos.containing(${input$x}, ${input$y}, ${input$z});
    world.updateNeighborsAt(_flwRedstonePos, world.getBlockState(_flwRedstonePos).getBlock());
}
