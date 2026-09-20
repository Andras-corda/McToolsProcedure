try {
    (${input$entity}).getPersistentData().merge(TagParser.parseTag(String.valueOf(${input$nbt})));
} catch (Exception _entNbtError) {
    // NBT invalide : ignoré
}
