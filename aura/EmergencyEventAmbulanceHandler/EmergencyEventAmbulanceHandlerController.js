({
	processMessage : function(component, event, helper) {
        var message = event.getParam("message");
        alert("Ambulance received message"+ message);
		
	}
})