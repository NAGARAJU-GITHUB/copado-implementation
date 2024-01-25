({
    doInit: function(component, event, helper) {
        helper.onInit(component,event,helper);
    },
    onRecordUpdated: function(component, event, helper) {
        var changeType = event.getParams().changeType;
        if (changeType === "ERROR") { /* handle error; do this first! */ }
        else if (changeType === "LOADED") { /* handle record load */ }
        else if (changeType === "REMOVED") { /* handle record removal */ }
        else if (changeType === "CHANGED") { 
            component.find("service").saveRecord(function(saveResult) {
                if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                    var resultsToast = $A.get("e.force:showToast");
                    if(resultsToast){
                        resultsToast.setParams({
                            "title": "Saved",
                            "message": "The record was saved."
                        });
                    }else{
                        alert('The record was not saved');
                    }
                    resultsToast.fire();
                }
            });   
        component.find("service").reloadRecord();
    }
    },
    onSave: function(component, event, helper) {
            var boatId = component.get("v.boat").Id;
            component.set("v.boatReview.Boat__c", boatId);
            component.find("service").saveRecord(function(saveResult) {
                if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                    var resultsToast = $A.get("e.force:showToast");
                    if(resultsToast){
                        resultsToast.setParams({
                            "title": "Saved",
                            "message": "The record was saved."
                        });
                    }else{
                        alert('The record was not saved');
                    }
                    resultsToast.fire();
                }
            });
           // component.find("service").reloadRecord();
           var boatReviewAdded = component.getEvent("BoatReviewAdded");
           //var boatReviewId = component.get("v.boatReview").Id;
           //boatReviewAdded.setParams({"boatReviewId":boatReviewId});
           boatReviewAdded.fire();
           
    }
})