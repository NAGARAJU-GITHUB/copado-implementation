({
    createItem : function(component,newCampingItem) {
        var action = component.get("c.saveItem");
        action.setParams({"campingItem":newCampingItem});
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS")
            {
                var campingItems = component.get("v.items");
                campingItems.push(response.getReturnValue());
                component.set("v.items",campingItems); 
            }
        });
        $A.enqueueAction(action);
    }
})