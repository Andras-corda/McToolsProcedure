if ((${input$entity}) instanceof LivingEntity _iaeEntity) {
    ItemStack _iaeStack = _iaeEntity.getMainHandItem();
    var _iaeEnchant = ForgeRegistries.ENCHANTMENTS.getValue(new ResourceLocation(String.valueOf(${input$enchantment})));
    if (_iaeEnchant != null && !_iaeStack.isEmpty()) {
        _iaeStack.enchant(_iaeEnchant, ${opt.toInt(input$level)});
    }
}
