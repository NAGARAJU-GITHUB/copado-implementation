({
    initHelper : function(component) {
        var action = component.get("c.getItems");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS")
            {
                component.set("v.boatTypes",response.getReturnValue());
            }

        });
        $A.enqueueAction(action);
    }
})