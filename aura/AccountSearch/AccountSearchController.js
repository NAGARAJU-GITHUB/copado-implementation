({
	getAllacc : function(component, event, helper) {
        var input = component.get("v.inputA");
        var ref = component.get("c.getAllAccount");
        
        ref.setParams({'name':input});
        ref.setCallback(this,function(response){
                                                var respState = response.getState();
                                                
                                                    if (respState=="SUCCESS")
                                                    {
                                                        var result = response.getReturnValue();
                                                        component.set("v.accList",result);   
                                                    }
                                                    else
                                                    {
                                                        alert("Please contact admin");
                                                    }
                                               
                                                });
        $A.enqueueAction(ref);   
	},
    showSpinner : function(component, event, helper) {
        
       //Get reference to spinner
       var spin = component.find("spinner");
       //remove hide
       $A.util.removeClass(spin,"slds-hide");
        
        
	},
    hideSpinner : function(component, event, helper) {
       //Get reference to spinner
       var spin = component.find("spinner");
       //apply hide
       $A.util.addClass(spin,"slds-hide");
        
	},
     viewCon : function(component, event, helper) {
         
       var input = component.get("v.accId");
       alert(input);
       var eventRef = component.getEvent("viewContact");
       
       eventRef.setParams({"displayContact":"Yes"});
        
        //3. Fire event
        eventRef.fire();
        
	}
})