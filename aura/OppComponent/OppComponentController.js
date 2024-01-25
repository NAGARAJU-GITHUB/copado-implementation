({
	getAllOpps : function(component, event, helper) {
        
        helper.displayToast();
        //1. Get reference of apex method
        var ref = component.get("c.getAllOpportunities");
        //2. Register callback function this function will invoked automatically
        //once client browser receives request from server
        //argument: 1. this 2. anomymous JS callback function 
        ref.setCallback(this,function(response){
        //3. check the state of the response
        var respState = response.getState();
        if (respState=="SUCCESS")
        {
            //4. Get the return value from response and set the same in oppList
            var result = response.getReturnValue();
            component.set("v.oppList",result);   
        }
        else
        {
            alert("Please contact admin");
        }
       
        });
        //5. Put the method call in framework's queue
        //$A.enqueueAction()
        //where $A has multiple javascript function
        $A.enqueueAction(ref);	
	},
    getWonOpps : function(component, event, helper) {
        helper.displayToast();
        //1. Get reference of apex method
        var ref = component.get("c.getWonOpportunities");
        //2. Register callback function this function will invoked automatically
        //once client browser receives request from server
        //argument: 1. this 2. anomymous JS callback function 
        ref.setCallback(this,function(response){
        //3. check the state of the response
        var respState = response.getState();
        if (respState=="SUCCESS")
        {
            //4. Get the return value from response and set the same in oppList
            var result = response.getReturnValue();
            component.set("v.oppList",result);   
        }
        else
        {
            alert("Please contact admin");
        }
       
        });
        //5. Put the method call in framework's queue
        //$A.enqueueAction()
        //where $A has multiple javascript function
        $A.enqueueAction(ref);
        	
	}
})