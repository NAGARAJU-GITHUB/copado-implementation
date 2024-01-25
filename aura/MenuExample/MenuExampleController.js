({
	handleSelect : function(component, event, helper) {
        
        var menuItemValue = event.getParam("value");
        //alert(menuItemValue);
        //create a component dynamically using $A.createcomponent() function 
        //argument 1. Name of the component along with namespace 
        //         2. Attribute, if any, in JSON format, if none, {}
        //         3. Anonmyous javascript funcation which takes one paramenter
        $A.createComponent("c:ModalExample",
                           {}, function(myBox)
                           {
                             //get the reference of div  
                             var modalDiv = component.find("modalDiv");
                             //set the div the body with myBox
                             modalDiv.set("v.body",myBox);
                           }
                          );
		
	}
})