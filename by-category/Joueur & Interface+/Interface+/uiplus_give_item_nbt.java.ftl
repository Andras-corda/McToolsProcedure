<#include "mcitems.ftl">
if ((${input$player}) instanceof ServerPlayer _flwGivePlayer) {
    ItemStack _flwGiveStack = ${mappedMCItemToItemStackCode(input$item)};
    try {
        _flwGiveStack.setTag(TagParser.parseTag(String.valueOf(${input$nbt})));
    } catch (Exception _flwNbtError) {
        // NBT invalide : l'objet est donné sans données supplémentaires
    }
    ItemHandlerHelper.giveItemToPlayer(_flwGivePlayer, _flwGiveStack);
}
