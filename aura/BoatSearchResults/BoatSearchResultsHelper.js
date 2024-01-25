({
    onSearch : function(component,event) {
        var action = component.get("c.getBoats");
        var params = event.getParam('arguments');
        if(params){
            var boatTypeId = params.boatTypeId;
        }else{
            var boatTypeId = component.get("v.boatTypeId");
        }
        action.setParams({"boatTypeId":boatTypeId});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS")
            {
                component.set("v.boats",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})