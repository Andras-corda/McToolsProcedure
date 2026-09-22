(${input$entity}).getPersistentData().putLong("cooldown_" + String.valueOf(${input$id}), world.getGameTime() + ${opt.toInt(input$duration)});
