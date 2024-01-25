({
    onBoatSelected : function(component, event, helper) {
        var boat = event.getParam("boat");
        component.set("v.id",boat.Id);
        component.find("service").reloadRecord();
    },
    onRecordUpdated : function(component, event, helper) {
        //component.find("service").reloadRecord();
        var boatReviewcmp = component.find("boatreviewtab");
        if(boatReviewcmp)
        {
            boatReviewcmp.refresh();
        }
    },
    onBoatReviewAdded : function(component, event, helper) {
        
        component.find("boatdetails").set('v.selectedTabId','boatreviewtab');
        var boatReviewcmp = component.find("boatreviewtab");
        if(boatReviewcmp)
        {
            boatReviewcmp.refresh();
        }
    }
})