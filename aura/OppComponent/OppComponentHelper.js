({
	displayToast : function() {
        var eventRef = $A.get("e.force:showToast");
        if(eventRef)
        {
            eventRef.setParams({"message":"Opps are getting loaded",
                                "title": "Message",
                                "duration": 6000,
                                "type":"success"});
            eventRef.fire();
            
            
        }
        else
        {
            alert("Opps are getting loaded");
        }
	}
})