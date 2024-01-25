({
	
    add : function(component, event, helper) {
	 
     var inputA = component.get("v.inputA");
     var inputB = component.get("v.inputB");
     var result = parseInt(inputA) + parseInt(inputB);
     component.set("v.result",result);
     //alert("Sum" + result);   
     var clip = component.find("clip");
     var clipElement = clip.getElement();
     clipElement.play();
      
	},
	sub : function(component, event, helper) {
        
     var inputA = component.get("v.inputA");
     var inputB = component.get("v.inputB");
     var result = inputA - inputB;
     component.set("v.result",result);
     //alert("Sub" + result); 
		
	},

	mul : function(component, event, helper) {
     var inputA = component.get("v.inputA");
     var inputB = component.get("v.inputB");
     var result = inputA * inputB;
     component.set("v.result",result);
     //alert("Mul" + result); 
		
	},

	div : function(component, event, helper) {
     var inputA = component.get("v.inputA");
     var inputB = component.get("v.inputB");
     var result = inputA / inputB;
     component.set("v.result",result);
     //alert("Div" + result); 
		
	},
 
})