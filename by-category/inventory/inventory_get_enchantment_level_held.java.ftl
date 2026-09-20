(new Object(){
    int level(Object entity, String enchantName) {
        if (!(entity instanceof LivingEntity le)) return 0;
        var enchant = ForgeRegistries.ENCHANTMENTS.getValue(new ResourceLocation(enchantName));
        if (enchant == null) return 0;
        return EnchantmentHelper.getItemEnchantmentLevel(enchant, le.getMainHandItem());
    }
}.level(${input$entity}, String.valueOf(${input$enchantment})))
