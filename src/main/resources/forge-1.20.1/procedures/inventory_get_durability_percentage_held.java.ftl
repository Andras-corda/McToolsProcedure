((${input$entity}) instanceof LivingEntity _igdEntity && !_igdEntity.getMainHandItem().isEmpty() && _igdEntity.getMainHandItem().getMaxDamage() > 0
    ? (1.0 - ((double) _igdEntity.getMainHandItem().getDamageValue() / _igdEntity.getMainHandItem().getMaxDamage())) * 100
    : 100)
