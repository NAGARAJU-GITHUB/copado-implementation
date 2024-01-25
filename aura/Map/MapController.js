({
    jsLoaded: function(component) {
        component.set("v.jsLoaded", true);
    } ,
    plotMapMarker: function(component,event) {
        var lat = event.getParam("lat");
        var long = event.getParam("long");
        var location = {"lat":lat,"long":long};
        component.set("v.location",location);
    } 
    
})