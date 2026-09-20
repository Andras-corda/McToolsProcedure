if (world instanceof ServerLevel _bbLevel) {
    ResourceLocation _bbId = new ResourceLocation("${modid}", String.valueOf(${input$id}).toLowerCase(java.util.Locale.ROOT).replaceAll("[^a-z0-9_./-]", "_"));
    var _bbEvent = _bbLevel.getServer().getCustomBossEvents().get(_bbId);
    if (_bbEvent == null) {
        _bbEvent = _bbLevel.getServer().getCustomBossEvents().create(_bbId, Component.literal(String.valueOf(${input$title})));
    } else {
        _bbEvent.setName(Component.literal(String.valueOf(${input$title})));
    }
    _bbEvent.setProgress((float) Mth.clamp(${input$progress}, 0, 1));
    _bbEvent.setColor(<#switch field$color><#case "PINK">BossEvent.BossBarColor.PINK<#break><#case "BLUE">BossEvent.BossBarColor.BLUE<#break><#case "RED">BossEvent.BossBarColor.RED<#break><#case "GREEN">BossEvent.BossBarColor.GREEN<#break><#case "YELLOW">BossEvent.BossBarColor.YELLOW<#break><#case "PURPLE">BossEvent.BossBarColor.PURPLE<#break><#case "WHITE">BossEvent.BossBarColor.WHITE<#break><#default>BossEvent.BossBarColor.WHITE</#switch>);
    if ((${input$player}) instanceof ServerPlayer _bbPlayer) {
        _bbEvent.addPlayer(_bbPlayer);
    }
}
