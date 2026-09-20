if (world instanceof ServerLevel _delayLevel) {
    int[] _delayCounter = { ${opt.toInt(input$delay)} };
    Runnable[] _delayTask = new Runnable[1];
    _delayTask[0] = () -> {
        if (_delayCounter[0] <= 0) {
            ${statement$body}
        } else {
            _delayCounter[0]--;
            _delayLevel.getServer().execute(_delayTask[0]);
        }
    };
    _delayLevel.getServer().execute(_delayTask[0]);
}
