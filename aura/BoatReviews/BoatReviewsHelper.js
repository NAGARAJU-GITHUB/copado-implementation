({
    onInit : function(component,event,helper) {
        var boatId = component.get("v.boat").Id;
        var action = component.get("c.getAll");
        action.setParams({"boatId": boatId});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                component.set("v.boatReviews",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        

    }
})