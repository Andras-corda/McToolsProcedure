(world instanceof ServerLevel _untLevel && _untLevel.getServer().getPlayerList().getPlayerByName(String.valueOf(${input$name})) != null
    ? _untLevel.getServer().getPlayerList().getPlayerByName(String.valueOf(${input$name})).getStringUUID()
    : "")
