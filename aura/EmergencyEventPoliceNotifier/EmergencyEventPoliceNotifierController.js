({
	dial911 : function(component, event, helper) {
        // 1. Get reference of the event using $A.get()
        // All application events will be under a special
        // namespace which starts with a.namespace notation 
     
        var eventRef = $A.get("e.c:EmergencyEvent");
        
        //Set param
        eventRef.setParams({"message":"House is on fire"})
        
        eventRef.fire();
        
		
	}
})