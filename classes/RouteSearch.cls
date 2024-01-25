@RestResource(urlMapping='/routesearch/*')
global with sharing class RouteSearch {
    @HttpGet
    global static RouteSearch__c doGet() {
	   RestRequest request = RestContext.request;

	   String a = request.params.get('CityA');
	   String b = request.params.get('CityB');
	   System.debug(a);	
	   System.debug(b);
       List<RouteSearch__c> r = [SELECT Start_Location__c, Available__c, End_Location__c, Id FROM RouteSearch__c Where Start_Location__c =:a];
	   Boolean avail = r[0].Available__c;
	   System.debug(avail);	
	   return r[0];
}
}