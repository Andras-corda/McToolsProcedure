(world.getEntitiesOfClass(Entity.class, new AABB(${input$x1}, ${input$y1}, ${input$z1}, ${input$x2}, ${input$y2}, ${input$z2}).inflate(${input$hit_radius}))
    .stream()
    .filter(_rtE -> {
        Vec3 _rtStart = new Vec3(${input$x1}, ${input$y1}, ${input$z1});
        Vec3 _rtEnd = new Vec3(${input$x2}, ${input$y2}, ${input$z2});
        Vec3 _rtSeg = _rtEnd.subtract(_rtStart);
        double _rtLenSq = _rtSeg.lengthSqr();
        double _rtT = _rtLenSq == 0 ? 0 : Mth.clamp(_rtE.position().subtract(_rtStart).dot(_rtSeg) / _rtLenSq, 0, 1);
        return _rtE.position().distanceTo(_rtStart.add(_rtSeg.scale(_rtT))) <= (${input$hit_radius});
    })
    .min(java.util.Comparator.comparingDouble(_rtE2 -> _rtE2.position().distanceTo(new Vec3(${input$x1}, ${input$y1}, ${input$z1}))))
    .orElse(null))
