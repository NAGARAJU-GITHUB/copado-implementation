({
    onBoatClick : function(component, event, helper) {
        var boatSelectEvent = component.getEvent("boatSelectEvent");
        var boatId = component.get("v.boat.Id");
        var boat = component.get("v.boat");
        boatSelectEvent.setParams({"boatId":boatId});
        boatSelectEvent.fire();

        var boatSelectedEvent = $A.get("e.c:BoatSelected");
        boatSelectedEvent.setParams({"boat":boat});
        boatSelectedEvent.fire();
        var label = component.get("v.boat").Name;
        var plotMapMarker = $A.get("e.c:PlotMapMarker");
        var lat = component.get("v.boat").Geolocation__Latitude__s;
        var long = component.get("v.boat").Geolocation__Longitude__s;
        plotMapMarker.setParams({   "sObjectId":boatId,
                                    "lat":lat,
                                    "long":long,
                                    "label":label});
        plotMapMarker.fire();
    }
})