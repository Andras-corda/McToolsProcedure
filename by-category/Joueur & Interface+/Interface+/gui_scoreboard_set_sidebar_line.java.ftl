if (world instanceof ServerLevel _sslLevel) {
    Scoreboard _sslScoreboard = _sslLevel.getScoreboard();
    Objective _sslObjective = _sslScoreboard.getObjective(String.valueOf(${input$objective}));
    if (_sslObjective == null) {
        _sslObjective = _sslScoreboard.addObjective(String.valueOf(${input$objective}), ObjectiveCriteria.DUMMY, Component.literal(String.valueOf(${input$objective})), ObjectiveCriteria.RenderType.INTEGER);
    }
    _sslScoreboard.setDisplayObjective(Scoreboard.DISPLAY_SLOT_SIDEBAR, _sslObjective);
    _sslScoreboard.getOrCreatePlayerScore(String.valueOf(${input$line}), _sslObjective).setScore(${opt.toInt(input$score)});
}
