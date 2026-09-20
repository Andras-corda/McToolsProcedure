try {
    ${statement$body}
} catch (Exception _tcChatEx) {
    _tcChatEx.printStackTrace();
    if ((${input$player}) instanceof ServerPlayer _tcChatPlayer) {
        _tcChatPlayer.displayClientMessage(Component.literal("§c[Erreur] " + _tcChatEx.getClass().getSimpleName() + ": " + _tcChatEx.getMessage()), false);
    }
}
