if (world instanceof ServerLevel _wswLevel) {
    int _wswDuration = Math.max(1, ${opt.toInt(input$duration)});
    <#switch field$weather>
    <#case "CLEAR">
    _wswLevel.setWeatherParameters(_wswDuration, 0, false, false);
    <#break>
    <#case "RAIN">
    _wswLevel.setWeatherParameters(0, _wswDuration, true, false);
    <#break>
    <#case "THUNDER">
    _wswLevel.setWeatherParameters(0, _wswDuration, true, true);
    <#break>
    </#switch>
}
