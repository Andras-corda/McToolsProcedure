if ((${input$player}) instanceof ServerPlayer _gtlPlayer) {
    _gtlPlayer.setTabListHeaderFooter(Component.literal(String.valueOf(${input$header})), Component.literal(String.valueOf(${input$footer})));
}
