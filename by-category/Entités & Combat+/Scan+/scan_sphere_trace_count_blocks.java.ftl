<#assign _stcbR = opt.toInt(input$radius) + 1>
<#assign _stcbSize = (_stcbR * 2 + 1)>
((int) java.util.stream.IntStream.range(0, ${_stcbSize} * ${_stcbSize} * ${_stcbSize})
    .mapToObj(_stcbI -> BlockPos.containing((${input$x1}) + (_stcbI % ${_stcbSize}) - ${_stcbR}, (${input$y1}) + ((_stcbI / ${_stcbSize}) % ${_stcbSize}) - ${_stcbR}, (${input$z1}) + (_stcbI / (${_stcbSize} * ${_stcbSize})) - ${_stcbR}))
    .filter(_stcbPos -> {
        Vec3 _stcbStart = new Vec3(${input$x1}, ${input$y1}, ${input$z1});
        Vec3 _stcbEnd = new Vec3(${input$x2}, ${input$y2}, ${input$z2});
        Vec3 _stcbSeg = _stcbEnd.subtract(_stcbStart);
        double _stcbLenSq = _stcbSeg.lengthSqr();
        Vec3 _stcbCenter = new Vec3(_stcbPos.getX() + 0.5, _stcbPos.getY() + 0.5, _stcbPos.getZ() + 0.5);
        double _stcbT = _stcbLenSq == 0 ? 0 : Mth.clamp(_stcbCenter.subtract(_stcbStart).dot(_stcbSeg) / _stcbLenSq, 0, 1);
        return _stcbCenter.distanceTo(_stcbStart.add(_stcbSeg.scale(_stcbT))) <= (${input$radius}) && !world.getBlockState(_stcbPos).isAir();
    })
    .count())
