if ((${input$entity}) instanceof ServerPlayer _dtpPlayer) {
    ServerLevel _dtpLevel = _dtpPlayer.getServer().getLevel(ResourceKey.create(Registries.DIMENSION, new ResourceLocation(String.valueOf(${input$dimension}))));
    if (_dtpLevel != null) {
        _dtpPlayer.teleportTo(_dtpLevel, ${input$x}, ${input$y}, ${input$z}, (float) (${input$yaw}), (float) (${input$pitch}));
    }
}
