(world.getBiome(BlockPos.containing(${input$x}, ${input$y}, ${input$z})).unwrapKey().map(_gbnKey -> _gbnKey.location().toString()).orElse("unknown"))
