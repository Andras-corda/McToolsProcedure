if ((${input$player}) instanceof Player _flwLayerPlayer) {
    try {
        java.lang.reflect.Field _flwLayerField = Player.class.getDeclaredField("DATA_PLAYER_MODE_CUSTOMISATION");
        _flwLayerField.setAccessible(true);
        @SuppressWarnings("unchecked")
        EntityDataAccessor<Byte> _flwLayerAccessor = (EntityDataAccessor<Byte>) _flwLayerField.get(null);
        int _flwLayerMask = (<#switch field$layer><#case "CAPE">PlayerModelPart.CAPE<#break><#case "JACKET">PlayerModelPart.JACKET<#break><#case "LEFT_SLEEVE">PlayerModelPart.LEFT_SLEEVE<#break><#case "RIGHT_SLEEVE">PlayerModelPart.RIGHT_SLEEVE<#break><#case "LEFT_PANTS">PlayerModelPart.LEFT_PANTS_LEG<#break><#case "RIGHT_PANTS">PlayerModelPart.RIGHT_PANTS_LEG<#break><#case "HAT">PlayerModelPart.HAT<#break><#default>PlayerModelPart.CAPE</#switch>).getMask();
        int _flwLayerCurrent = _flwLayerPlayer.getEntityData().get(_flwLayerAccessor);
        byte _flwLayerNew = (byte) ((${input$visible}) ? (_flwLayerCurrent | _flwLayerMask) : (_flwLayerCurrent & ~_flwLayerMask));
        _flwLayerPlayer.getEntityData().set(_flwLayerAccessor, _flwLayerNew);
    } catch (Exception _flwLayerError) {
        // Réflexion indisponible : le layer n'a pas pu être changé sur cette installation
    }
}
