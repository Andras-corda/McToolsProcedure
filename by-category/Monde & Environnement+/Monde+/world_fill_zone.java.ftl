<#include "mcitems.ftl">
{
    int _wfzMinX = (int) Math.floor(Math.min(${input$x1}, ${input$x2}));
    int _wfzMaxX = (int) Math.floor(Math.max(${input$x1}, ${input$x2}));
    int _wfzMinY = (int) Math.floor(Math.min(${input$y1}, ${input$y2}));
    int _wfzMaxY = (int) Math.floor(Math.max(${input$y1}, ${input$y2}));
    int _wfzMinZ = (int) Math.floor(Math.min(${input$z1}, ${input$z2}));
    int _wfzMaxZ = (int) Math.floor(Math.max(${input$z1}, ${input$z2}));
    long _wfzVolume = (long) (_wfzMaxX - _wfzMinX + 1) * (_wfzMaxY - _wfzMinY + 1) * (_wfzMaxZ - _wfzMinZ + 1);
    if (_wfzVolume <= 262144) {
        for (int _wfzX = _wfzMinX; _wfzX <= _wfzMaxX; _wfzX++) {
            for (int _wfzY = _wfzMinY; _wfzY <= _wfzMaxY; _wfzY++) {
                for (int _wfzZ = _wfzMinZ; _wfzZ <= _wfzMaxZ; _wfzZ++) {
                    world.setBlock(new BlockPos(_wfzX, _wfzY, _wfzZ), ${mappedBlockToBlockStateCode(input$block)}, 3);
                }
            }
        }
    }
}
