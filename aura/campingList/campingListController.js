({
    doInit : function(component,event,helper){

        var action = component.get("c.getItems");
        $A.enqueueAction(action);
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS")
            {
                component.set("v.items",response.getReturnValue());
            }

        });
    },
    handleAddItem : function(component, event, helper) {
        var newCampingItem = event.getParam("item");
       	alert("Test " + newCampingItem);
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
        
        //helper.createItem(component,newCampingItem);
    }
})