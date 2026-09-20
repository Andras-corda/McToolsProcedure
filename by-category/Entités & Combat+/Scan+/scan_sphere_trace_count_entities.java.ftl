((int) world.getEntitiesOfClass(Entity.class, new AABB(${input$x1}, ${input$y1}, ${input$z1}, ${input$x2}, ${input$y2}, ${input$z2}).inflate(${input$radius}))
    .stream()
    .filter(_stceE -> {
        Vec3 _stceStart = new Vec3(${input$x1}, ${input$y1}, ${input$z1});
        Vec3 _stceEnd = new Vec3(${input$x2}, ${input$y2}, ${input$z2});
        Vec3 _stceSeg = _stceEnd.subtract(_stceStart);
        double _stceLenSq = _stceSeg.lengthSqr();
        double _stceT = _stceLenSq == 0 ? 0 : Mth.clamp(_stceE.position().subtract(_stceStart).dot(_stceSeg) / _stceLenSq, 0, 1);
        return _stceE.position().distanceTo(_stceStart.add(_stceSeg.scale(_stceT))) <= (${input$radius});
    })
    .count())
