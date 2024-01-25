({
        doInit : function(component,event,helper){
            var boatRecordEvent = $A.get("e.force:navigateToSObject");
            if(boatRecordEvent)
            {
                component.set("v.showDetailsbutton",true);
            }
        },
    onFullDetails : function(component, event, helper) {
        var boatRecordEvent = $A.get("e.force:navigateToSObject");
        var boatId = component.get("v.boat.Id");
        boatRecordEvent.setParams({
        "recordId":boatId ,
        "slideDevName": "related"
        });
        boatRecordEvent.fire();

    }
})