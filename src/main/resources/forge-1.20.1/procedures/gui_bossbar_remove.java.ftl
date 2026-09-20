if (world instanceof ServerLevel _bbrLevel) {
    ResourceLocation _bbrId = new ResourceLocation("${modid}", String.valueOf(${input$id}).toLowerCase(java.util.Locale.ROOT).replaceAll("[^a-z0-9_./-]", "_"));
    var _bbrEvent = _bbrLevel.getServer().getCustomBossEvents().get(_bbrId);
    if (_bbrEvent != null) {
        _bbrLevel.getServer().getCustomBossEvents().remove(_bbrEvent);
    }
}
