<#assign _stbR = opt.toInt(input$radius) + 1>
<#assign _stbSize = (_stbR * 2 + 1)>
/*@BlockState*/(
    java.util.stream.IntStream.range(0, ${_stbSize} * ${_stbSize} * ${_stbSize})
        .mapToObj(_stbI -> BlockPos.containing((${input$x1}) + (_stbI % ${_stbSize}) - ${_stbR}, (${input$y1}) + ((_stbI / ${_stbSize}) % ${_stbSize}) - ${_stbR}, (${input$z1}) + (_stbI / (${_stbSize} * ${_stbSize})) - ${_stbR}))
        .filter(_stbPos -> {
            Vec3 _stbStart = new Vec3(${input$x1}, ${input$y1}, ${input$z1});
            Vec3 _stbEnd = new Vec3(${input$x2}, ${input$y2}, ${input$z2});
            Vec3 _stbSeg = _stbEnd.subtract(_stbStart);
            double _stbLenSq = _stbSeg.lengthSqr();
            Vec3 _stbCenter = new Vec3(_stbPos.getX() + 0.5, _stbPos.getY() + 0.5, _stbPos.getZ() + 0.5);
            double _stbT = _stbLenSq == 0 ? 0 : Mth.clamp(_stbCenter.subtract(_stbStart).dot(_stbSeg) / _stbLenSq, 0, 1);
            return _stbCenter.distanceTo(_stbStart.add(_stbSeg.scale(_stbT))) <= (${input$radius}) && !world.getBlockState(_stbPos).isAir();
        })
        .min(java.util.Comparator.comparingDouble(_stbPos2 -> _stbPos2.distSqr(BlockPos.containing(${input$x1}, ${input$y1}, ${input$z1}))))
        .map(world::getBlockState)
        .orElse(Blocks.AIR.defaultBlockState())
)
