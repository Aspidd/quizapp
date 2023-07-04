sap.ui.define([
	"shop/controller/BaseController",
	"sap/ui/model/json/JSONModel"
], function (BaseController, JSONModel) {
	"use strict";
	return BaseController.extend("shop.controller.App", {
		onInit() {
			this.configModel = new JSONModel({
				isSideExpanded: true
			});
			this.getView().setModel(this.configModel, "config");

			this.loginModel = new JSONModel({
				email: null,
				password: null
			});
			this.getView().setModel(this.loginModel, "login");

			this.oLoginDialog = null;
		},

		toggleSideNav(bIsSideExpanded) {
			this.configModel.setProperty("/isSideExpanded", !bIsSideExpanded);
		},

		сhangeTheme(oEvent) {
			const bState = oEvent.getParameter("state");
			sap.ui.getCore().applyTheme(bState ? "sap_horizon_dark" : "sap_horizon");
		},

		onOpenLoginDialog() {
			if(!this.oLoginDialog) {
				this.loadFragment({name: "shop.view.modal.LoginDialog"}).then(oFragment => {
					this.oLoginDialog = oFragment;
					this.oLoginDialog.open();
				});
			}
			else {
				this.oLoginDialog.open();
			}
		},

		onLogin(oEvent) {
			const oLoginData = this.loginModel.getData();
			const oLoginAction = this.oLoginDialog.getObjectBinding("shopService");
			oLoginAction.setParameter("email", oLoginData.email);
			oLoginAction.setParameter("password", oLoginData.password);
			oLoginAction.execute()
				.then(data => {
					console.log(data);
					this.oLoginDialog.close();
				})
				.catch(error => {
					console.log(error);
				});
		}
	});
});