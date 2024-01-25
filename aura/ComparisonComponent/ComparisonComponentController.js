({
	extract : function(component, event, helper) {
 
        var ref = component.get("c.restGet");
        ref.setCallback(this,function(response){
                                                var respState = response.getState();
                                                if (respState=="SUCCESS")
                                                {
                                                    var custs = [];
                                                    var result = response.getReturnValue();
                                                    for(var key in result)
                                                        {
                                                            custs.push({value:result[key], key:key}); 
                                                        }
                                                     alert(custs);
                                                    component.set("v.extractList",custs); 
                                                    component.set("v.showBool", true);
                                                   
                                                }
                                                else
                                                {
                                                    alert("Please contact admin");
                                                }
                                               
                                                });
        $A.enqueueAction(ref);
		
	}
})