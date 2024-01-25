({
    createItem : function(component,newCampingItem) {
        var addItemEvent = component.getEvent("addItem");
        addItemEvent.setParams({"item": newCampingItem})
        addItemEvent.fire();
        component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                                                            'Name': '',
                                                            'Quantity__c': 0,
                                                            'Price__c': 0,
                                                            'Packed__c': false});
    }
})