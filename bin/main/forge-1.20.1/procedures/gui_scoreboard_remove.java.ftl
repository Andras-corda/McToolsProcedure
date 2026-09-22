if (world instanceof ServerLevel _srLevel) {
    Objective _srObjective = _srLevel.getScoreboard().getObjective(String.valueOf(${input$objective}));
    if (_srObjective != null) {
        _srLevel.getScoreboard().removeObjective(_srObjective);
    }
}
