({
    onInit : function(component,event,helper) {
        component.find("service").getNewRecord(
            "BoatReview__c", 
            null, 
            false,  
            $A.getCallback(function() {
                var rec = component.get("v.boatReview");
                var recordError = component.get("v.recordError");
                if(recordError || (rec === null)) {
                    console.log("Error initializing record template: " + recordError);
                    return;
                }
                var boatId = component.get("v.boat").Id;
                component.set("v.boatReview.Boat__c",boatId);
            })
        );
    }
})