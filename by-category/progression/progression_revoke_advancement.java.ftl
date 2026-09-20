if ((${input$player}) instanceof ServerPlayer _raPlayer && world.getServer() != null) {
    Advancement _raAdv = world.getServer().getAdvancements().getAdvancement(ResourceLocation.parse(String.valueOf(${input$advancement})));
    if (_raAdv != null) {
        AdvancementProgress _raProgress = _raPlayer.getAdvancements().getOrStartProgress(_raAdv);
        java.util.List<String> _raCriteria = new java.util.ArrayList<>();
        for (String _raC : _raProgress.getCompletedCriteria()) _raCriteria.add(_raC);
        for (String _raCriterion : _raCriteria) {
            _raPlayer.getAdvancements().revoke(_raAdv, _raCriterion);
        }
    }
}
