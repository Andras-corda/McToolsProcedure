if ((${input$player}) instanceof ServerPlayer _gaPlayer && world.getServer() != null) {
    Advancement _gaAdv = world.getServer().getAdvancements().getAdvancement(ResourceLocation.parse(String.valueOf(${input$advancement})));
    if (_gaAdv != null) {
        AdvancementProgress _gaProgress = _gaPlayer.getAdvancements().getOrStartProgress(_gaAdv);
        java.util.List<String> _gaCriteria = new java.util.ArrayList<>();
        for (String _gaC : _gaProgress.getRemainingCriteria()) _gaCriteria.add(_gaC);
        for (String _gaCriterion : _gaCriteria) {
            _gaPlayer.getAdvancements().award(_gaAdv, _gaCriterion);
        }
    }
}
