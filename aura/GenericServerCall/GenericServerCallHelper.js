({
    serverMethodCall : function(component,methodName,attributeName,event,params) {
          
        var btnClicked = event.getSource();
        var label = btnClicked.get("v.label");
            if (label == "Get All Opp")
            {
                btnClicked.set("v.variant","brand");
                var btn = component.find("btn2");
                btn.set("v.variant","neutral");
            } 
            else if (label == "Get Won Opp")
            {
                btnClicked.set("v.variant","brand");
                var btn = component.find("btn1");
                btn.set("v.variant","neutral");   
            }
        //1. Get reference of apex method
        var ref = component.get(methodName);
        // Set params if any
        if(params)
        {
            ref.setParams(params);
        }
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
            component.set(attributeName,result);   
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