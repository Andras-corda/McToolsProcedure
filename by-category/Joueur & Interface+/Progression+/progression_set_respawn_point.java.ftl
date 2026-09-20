if ((${input$player}) instanceof ServerPlayer _srpPlayer) {
    _srpPlayer.setRespawnPosition(_srpPlayer.level().dimension(), BlockPos.containing(${input$x}, ${input$y}, ${input$z}), 0f, true, false);
}
