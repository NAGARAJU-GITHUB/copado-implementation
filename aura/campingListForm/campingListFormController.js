({
    clickCreateItem : function(component, event, helper) {
        var validform = component.find("campingList").reduce(function(validSoFar,inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get("v.validity").valid;},true);
            if(validform)
            {
                var newCampingItem = component.get("v.newItem");
                helper.createItem(component,newCampingItem);
              
            } 
    }
})