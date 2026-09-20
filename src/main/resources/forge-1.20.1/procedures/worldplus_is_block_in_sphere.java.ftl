<#include "mcitems.ftl">
(java.util.stream.IntStream.rangeClosed(-(${opt.toInt(input$radius)}), ${opt.toInt(input$radius)}).anyMatch(_sibDx ->
    java.util.stream.IntStream.rangeClosed(-(${opt.toInt(input$radius)}), ${opt.toInt(input$radius)}).anyMatch(_sibDy ->
        java.util.stream.IntStream.rangeClosed(-(${opt.toInt(input$radius)}), ${opt.toInt(input$radius)}).anyMatch(_sibDz ->
            _sibDx * _sibDx + _sibDy * _sibDy + _sibDz * _sibDz <= (${opt.toInt(input$radius)}) * (${opt.toInt(input$radius)})
                && world.getBlockState(BlockPos.containing((${input$x}) + _sibDx, (${input$y}) + _sibDy, (${input$z}) + _sibDz)).is(${mappedBlockToBlock(input$block)})
        )
    )
))
