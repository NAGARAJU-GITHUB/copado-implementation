({
    onFormSubmit : function(component, event, helper) {
        var formData = event.getParam("formData");
        var cmpsearchResult = component.find("cmpsearchResult");
        cmpsearchResult.search(formData.boatTypeId);
    }
})