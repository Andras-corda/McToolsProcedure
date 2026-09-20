if ((${input$entity}) instanceof Mob _afMob) {
    Vec3 _afAway = _afMob.position().subtract((${input$threat}).position());
    if (_afAway.lengthSqr() > 0.01) {
        Vec3 _afTarget = _afMob.position().add(_afAway.normalize().scale(16));
        _afMob.getNavigation().moveTo(_afTarget.x, _afTarget.y, _afTarget.z, ${input$speed});
    }
}
