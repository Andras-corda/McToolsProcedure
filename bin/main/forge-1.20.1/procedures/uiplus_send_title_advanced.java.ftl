if ((${input$player}) instanceof ServerPlayer _flwTitlePlayer) {
    _flwTitlePlayer.connection.send(new ClientboundSetTitlesAnimationPacket(${opt.toInt(input$fadein)}, ${opt.toInt(input$stay)}, ${opt.toInt(input$fadeout)}));
    _flwTitlePlayer.connection.send(new ClientboundSetTitleTextPacket(Component.literal(String.valueOf(${input$title}))));
    _flwTitlePlayer.connection.send(new ClientboundSetSubtitleTextPacket(Component.literal(String.valueOf(${input$subtitle}))));
}
