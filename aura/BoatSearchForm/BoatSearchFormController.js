({
    doInit : function(component,event,helper){

        var createRecordEvent = $A.get("event.force:createRecord");
        if(createRecordEvent)
        {
            component.set("v.showNewbutton",true);
        }
        helper.initHelper(component);
    },
    createNewBoat : function(component,event,helper)
    {
        var selectList = component.find("selectList");
        var boatTypeId = selectList.get("v.value");
        if(boatTypeId)
        {
          var createRecordEvent = $A.get("event.force:createRecord");
            createRecordEvent.setParams({
                "entityApiName": "Boat__c",
                "defaultFieldValues":{"BoatType__c": boatTypeId}
            });
            createRecordEvent.fire();
  
        }
    },
    onFormSubmit : function(component,event,helper){
        var formsubmitEvent = component.getEvent("formsubmit");
        var selectList = component.find("selectList");
        var boatTypeId = selectList.get("v.value"); 
        var formData = {"boatTypeId" : boatTypeId};
        formsubmitEvent.setParams({"formData": formData});
        formsubmitEvent.fire();
    }
})