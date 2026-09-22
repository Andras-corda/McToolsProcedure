(new Object(){
    boolean check(Entity e, String key, long interval, long now) {
        long last = e.getPersistentData().getLong("ratelimit_" + key);
        if (now - last >= interval) {
            e.getPersistentData().putLong("ratelimit_" + key, now);
            return true;
        }
        return false;
    }
}.check(${input$entity}, String.valueOf(${input$id}), ${opt.toInt(input$interval)}, world.getGameTime()))
