if ((${input$entity}) instanceof ServerPlayer _dstPlayer) {
    ServerLevel _dstLevel = _dstPlayer.getServer().getLevel(ResourceKey.create(Registries.DIMENSION, new ResourceLocation(String.valueOf(${input$dimension}))));
    if (_dstLevel != null) {
        BlockPos _dstSafe = _dstLevel.getHeightmapPos(Heightmap.Types.MOTION_BLOCKING, BlockPos.containing(${input$x}, ${input$y}, ${input$z}));
        _dstPlayer.teleportTo(_dstLevel, _dstSafe.getX() + 0.5, _dstSafe.getY(), _dstSafe.getZ() + 0.5, _dstPlayer.getYRot(), _dstPlayer.getXRot());
    }
}
