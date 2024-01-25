({
	sendMessage : function(component, event, helper) {
        //1. Get reference of the event using component.getEvent();
        // and pass value of name attribute 
        var eventRef = component.getEvent("signalJump");
        //2. Set event attribute JSON Format 
        
        eventRef.setParams({"message":"Ketan jumped signal, fine him"});
        
        //3. Fire event
        eventRef.fire();
        
		
	}
})