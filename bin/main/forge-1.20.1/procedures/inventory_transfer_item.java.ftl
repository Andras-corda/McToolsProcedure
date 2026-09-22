<#include "mcitems.ftl">
if ((${input$from_entity}) instanceof Player _itFrom && (${input$to_entity}) instanceof Player _itTo) {
    int _itRemaining = ${opt.toInt(input$amount)};
    for (int _itI = 0; _itI < _itFrom.getInventory().items.size() && _itRemaining > 0; _itI++) {
        ItemStack _itStack = _itFrom.getInventory().items.get(_itI);
        if (!_itStack.isEmpty() && _itStack.is(${mappedMCItemToItem(input$item)})) {
            int _itTake = Math.min(_itRemaining, _itStack.getCount());
            ItemStack _itMoved = _itStack.copy();
            _itMoved.setCount(_itTake);
            _itStack.shrink(_itTake);
            ItemHandlerHelper.giveItemToPlayer(_itTo, _itMoved);
            _itRemaining -= _itTake;
        }
    }
}
