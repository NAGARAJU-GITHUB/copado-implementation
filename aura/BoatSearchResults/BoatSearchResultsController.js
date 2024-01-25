({
    doInit : function(component, event, helper) {
       helper.onSearch(component,event);
    },
    doSearch : function(component, event, helper) {
        
        helper.onSearch(component,event);
     },
     onBoatSelect : function(component, event, helper) {
        var boatId = event.getParam("boatId");
        component.set("v.selectedBoatId",boatId);
   }
})