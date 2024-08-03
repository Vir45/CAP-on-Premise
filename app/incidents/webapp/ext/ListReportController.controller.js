sap.ui.define(["sap/ui/core/mvc/ControllerExtension"], function (ControllerExtension) {
    "use strict";
    return ControllerExtension.extend("ns.incidents.ListReportController", {
        override: {
            onInit() {
                this._oView = this.getView();
            }
        },

        async onShowCollections() {
            this._oCollectionsDialog = await this.loadFragment("ns.incidents.fragments", "ServiceCollection");
            this._oCollectionsDialog.open();
        },

        async loadFragment(sPAth, sName) {
            try {
                this._oView.setBusy(true);
                return await this.base.getExtensionAPI().loadFragment({
                    id: sName,
                    name: `${sPAth}.${sName}`,
                    controller: this,
                });
            } finally {
                this._oView.setBusy(false);
            }
        },

        onCloseCollectionDialog() {
            this._oCollectionsDialog.close().destroy();
        },


    });
});