({
	handleClick : function(component, event, helper) {
        //set variant of all button as neutral
        for(var i=1;i<=4;i++)
        {
            var btn = component.find(i);
            btn.set("v.variant","neutral");
        }
        //set variant of button that's been clicked as "base"
		var btnClicked = event.getSource();
        btnClicked.set("v.variant","brand");
	}
})