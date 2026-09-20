if (world instanceof ServerLevel _srtLevel) {
    Entity _srtEntity = ${input$entity};
    String _srtKey = "repeat_active_" + String.valueOf(${input$id});
    int _srtInterval = Math.max(1, ${opt.toInt(input$interval)});
    _srtEntity.getPersistentData().putBoolean(_srtKey, true);
    int[] _srtCounter = { _srtInterval };
    Runnable[] _srtTask = new Runnable[1];
    _srtTask[0] = () -> {
        if (!_srtEntity.getPersistentData().getBoolean(_srtKey)) return;
        if (_srtCounter[0] <= 0) {
            ${statement$body}
            _srtCounter[0] = _srtInterval;
        } else {
            _srtCounter[0]--;
        }
        if (_srtEntity.getPersistentData().getBoolean(_srtKey)) {
            _srtLevel.getServer().execute(_srtTask[0]);
        }
    };
    _srtLevel.getServer().execute(_srtTask[0]);
}
