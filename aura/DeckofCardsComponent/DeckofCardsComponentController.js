({
	handleClick : function(component, event, helper) {
        //set variant of all button as neutral
        for(var i=1;i<=2;i++)
        {
            var btn = component.find(i);
            btn.set("v.variant","neutral");
        }
        //set variant of button that's been clicked as "base"
		var btnClicked = event.getSource();
        btnClicked.set("v.variant","brand");
        //Get label of button that's been clicked 
        var clickLabel = btnClicked.get("v.label");
        
        //Get references of both div's which are repeating
        var rajini = component.find("rajini");
        var vijay = component.find("vijay");
        
        //check which button has been clicked and remove/add
        //slds hide accordingly (on div's)
        if(clickLabel == "Rajini")
        {
            $A.util.removeClass(rajini,"slds-hide");
            $A.util.addClass(vijay,"slds-hide");
        }
        else
        {
            $A.util.removeClass(vijay,"slds-hide");
            $A.util.addClass(rajini,"slds-hide");
        }
        
	}
})