sap.ui.define([
	"sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent"
], function (Controller, UIComponent) { 
	"use strict";
	return Controller.extend("shop.controller.BaseController", {
		getRouter() {
            return UIComponent.getRouterFor(this);
        },
		onDialogClose(oEvent) {
			oEvent.getSource().getParent().close();
		}
	});
});