({
	getAllAcc : function(component, event, helper) {
        helper.serverMethodCall(component,"c.getAllAccount","v.accList",event);  	
	},
    getProspectAcc : function(component, event, helper) {
        helper.serverMethodCall(component,"c.getProspectAccount","v.accList",event);     	
	}
})