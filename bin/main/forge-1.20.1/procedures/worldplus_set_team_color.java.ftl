if (world instanceof Level _flwTeamLevel) {
    Scoreboard _flwScoreboard = _flwTeamLevel.getScoreboard();
    PlayerTeam _flwTeam = _flwScoreboard.getPlayerTeam(String.valueOf(${input$teamname}));
    if (_flwTeam == null) {
        _flwTeam = _flwScoreboard.addPlayerTeam(String.valueOf(${input$teamname}));
    }
    _flwTeam.setColor(<#switch field$color><#case "BLACK">ChatFormatting.BLACK<#break><#case "DARK_BLUE">ChatFormatting.DARK_BLUE<#break><#case "DARK_GREEN">ChatFormatting.DARK_GREEN<#break><#case "DARK_AQUA">ChatFormatting.DARK_AQUA<#break><#case "DARK_RED">ChatFormatting.DARK_RED<#break><#case "DARK_PURPLE">ChatFormatting.DARK_PURPLE<#break><#case "GOLD">ChatFormatting.GOLD<#break><#case "GRAY">ChatFormatting.GRAY<#break><#case "DARK_GRAY">ChatFormatting.DARK_GRAY<#break><#case "BLUE">ChatFormatting.BLUE<#break><#case "GREEN">ChatFormatting.GREEN<#break><#case "AQUA">ChatFormatting.AQUA<#break><#case "RED">ChatFormatting.RED<#break><#case "LIGHT_PURPLE">ChatFormatting.LIGHT_PURPLE<#break><#case "YELLOW">ChatFormatting.YELLOW<#break><#case "WHITE">ChatFormatting.WHITE<#break><#default>ChatFormatting.WHITE</#switch>);
}
