<#assign _flwParticle><#switch field$particle_type><#case "FLAME">ParticleTypes.FLAME<#break><#case "SMOKE">ParticleTypes.SMOKE<#break><#case "LARGE_SMOKE">ParticleTypes.LARGE_SMOKE<#break><#case "HEART">ParticleTypes.HEART<#break><#case "EXPLOSION">ParticleTypes.EXPLOSION<#break><#case "PORTAL">ParticleTypes.PORTAL<#break><#case "CLOUD">ParticleTypes.CLOUD<#break><#case "NOTE">ParticleTypes.NOTE<#break><#case "CRIT">ParticleTypes.CRIT<#break><#case "END_ROD">ParticleTypes.END_ROD<#break><#case "SNOWFLAKE">ParticleTypes.SNOWFLAKE<#break><#case "SOUL_FIRE_FLAME">ParticleTypes.SOUL_FIRE_FLAME<#break><#default>ParticleTypes.FLAME</#switch></#assign>
{
    double _flwX1 = ${input$x1}; double _flwY1 = ${input$y1}; double _flwZ1 = ${input$z1};
    double _flwX2 = ${input$x2}; double _flwY2 = ${input$y2}; double _flwZ2 = ${input$z2};
    int _flwPoints = Math.max(2, ${opt.toInt(input$points)});
    for (int _flwI = 0; _flwI <= _flwPoints; _flwI++) {
        double _flwT = (double) _flwI / _flwPoints;
        double _flwPx = _flwX1 + (_flwX2 - _flwX1) * _flwT;
        double _flwPy = _flwY1 + (_flwY2 - _flwY1) * _flwT;
        double _flwPz = _flwZ1 + (_flwZ2 - _flwZ1) * _flwT;
        if (world instanceof ServerLevel _flwLevel) {
            _flwLevel.sendParticles(${_flwParticle}, _flwPx, _flwPy, _flwPz, 1, 0.0, 0.0, 0.0, 0.0);
        }
    }
}
