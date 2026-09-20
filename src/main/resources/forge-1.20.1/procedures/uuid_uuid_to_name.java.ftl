(world instanceof ServerLevel _utnLevel && _utnLevel.getServer().getPlayerList().getPlayer(java.util.UUID.fromString(String.valueOf(${input$uuid}))) != null
    ? _utnLevel.getServer().getPlayerList().getPlayer(java.util.UUID.fromString(String.valueOf(${input$uuid}))).getGameProfile().getName()
    : "")
