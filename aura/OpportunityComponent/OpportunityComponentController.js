({
	getAllOpps : function(component, event, helper) {
        
        helper.serverMethodCall(component,"c.getAllOpportunities","v.oppList",event);  	
	},
    getWonOpps : function(component, event, helper) {
        
        helper.serverMethodCall(component,"c.getWonOpportunities","v.oppList",event);
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
        
	}
})