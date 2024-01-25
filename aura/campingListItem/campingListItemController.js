({
    packItem : function(component, event, helper) {

        var btnClicked = event.getSource();
        var btnLabel = btnClicked.get("v.label");
       
        if (btnLabel == "Packed")
        {
            component.set("v.item.Packed__c",true);
            btnClicked.set("v.disabled",true);
        }
    }
})