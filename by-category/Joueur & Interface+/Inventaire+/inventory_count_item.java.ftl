<#include "mcitems.ftl">
((${input$entity}) instanceof Player _icPlayer ? (int) _icPlayer.getInventory().items.stream().filter(_icStack -> !_icStack.isEmpty() && _icStack.is(${mappedMCItemToItem(input$item)})).mapToInt(ItemStack::getCount).sum() : 0)
