if ((${input$entity}) instanceof Player _isPlayer) {
    java.util.List<ItemStack> _isItems = new java.util.ArrayList<>(_isPlayer.getInventory().items);
    _isItems.removeIf(ItemStack::isEmpty);
    _isItems.sort(java.util.Comparator.comparing(_isStack -> ForgeRegistries.ITEMS.getKey(_isStack.getItem()).toString()));
    for (int _isI = 0; _isI < _isPlayer.getInventory().items.size(); _isI++) {
        _isPlayer.getInventory().items.set(_isI, _isI < _isItems.size() ? _isItems.get(_isI) : ItemStack.EMPTY);
    }
}
