if ((${input$player}) instanceof Player _rebPlayer) {
    java.util.List<Enchantment> _rebAll = ForgeRegistries.ENCHANTMENTS.getValues().stream().filter(Enchantment::isDiscoverable).collect(java.util.stream.Collectors.toList());
    if (!_rebAll.isEmpty()) {
        Enchantment _rebChosen = _rebAll.get((int) (Math.random() * _rebAll.size()));
        int _rebCap = Math.max(1, Math.min(_rebChosen.getMaxLevel(), ${opt.toInt(input$max_level)}));
        int _rebLevel = 1 + (int) (Math.random() * _rebCap);
        ItemStack _rebBook = EnchantedBookItem.createForEnchantment(new EnchantmentInstance(_rebChosen, Math.min(_rebLevel, _rebCap)));
        ItemHandlerHelper.giveItemToPlayer(_rebPlayer, _rebBook);
    }
}
