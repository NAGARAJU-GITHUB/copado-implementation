({
	viewrec : function(component, event, helper) {
        //get sid value
        var sid = component.get("v.sid");
        //1. Get reference of the force:navigateToSobject
        var eventRef = $A.get("e.force:navigateToSObject");
        if(eventRef)
        {
            eventRef.setParams({"recordId":sid});
            eventRef.fire();
        }else
        {
            alert("Please LEX or Salesforce1App")
        }
        
		
	},
    editrec : function(component, event, helper) {
        //get sid value
        var sid = component.get("v.sid");
        //1. Get reference of the force:navigateToSobject
        var eventRef = $A.get("e.force:editRecord");
        if(eventRef)
        {
            eventRef.setParams({"recordId":sid});
            eventRef.fire();
        }else
        {
            alert("Please LEX or Salesforce1App")
        }
	}
})