<#assign _flcParticle><#switch field$particle_type><#case "FLAME">ParticleTypes.FLAME<#break><#case "SMOKE">ParticleTypes.SMOKE<#break><#case "LARGE_SMOKE">ParticleTypes.LARGE_SMOKE<#break><#case "HEART">ParticleTypes.HEART<#break><#case "EXPLOSION">ParticleTypes.EXPLOSION<#break><#case "PORTAL">ParticleTypes.PORTAL<#break><#case "CLOUD">ParticleTypes.CLOUD<#break><#case "NOTE">ParticleTypes.NOTE<#break><#case "CRIT">ParticleTypes.CRIT<#break><#case "END_ROD">ParticleTypes.END_ROD<#break><#case "SNOWFLAKE">ParticleTypes.SNOWFLAKE<#break><#case "SOUL_FIRE_FLAME">ParticleTypes.SOUL_FIRE_FLAME<#break><#default>ParticleTypes.FLAME</#switch></#assign>
{
    double _flcX = ${input$x}; double _flcY = ${input$y}; double _flcZ = ${input$z};
    double _flcRadius = ${input$radius};
    int _flcPoints = Math.max(3, ${opt.toInt(input$points)});
    for (int _flcI = 0; _flcI < _flcPoints; _flcI++) {
        double _flcAngle = (2 * Math.PI * _flcI) / _flcPoints;
        double _flcPx = _flcX + _flcRadius * Math.cos(_flcAngle);
        double _flcPz = _flcZ + _flcRadius * Math.sin(_flcAngle);
        if (world instanceof ServerLevel _flcLevel) {
            _flcLevel.sendParticles(${_flcParticle}, _flcPx, _flcY, _flcPz, 1, 0.0, 0.0, 0.0, 0.0);
        }
    }
}
