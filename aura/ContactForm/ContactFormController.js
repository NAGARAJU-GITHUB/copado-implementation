({
	save : function(component, event, helper) {
        var cont = component.get("v.cont");
        helper.serverMethodCall(component,"c.createContact","v.status",event,{"con": cont})
		
	},
    
    validateLN : function(component, event, helper) {
      var cont = component.get("v.cont");
      var btn = component.find("btn1");
        
      if(cont.LastName.length >= 2)
      {
          btn.set("v.disabled",false)
      }
        else
        {
            btn.set("{! v.disabled}",true)
        }
      
      
		
	}
})