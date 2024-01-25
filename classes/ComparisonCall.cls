public with sharing class ComparisonCall {
    @AuraEnabled	
	public static Map<String,String> getExtract() 
	{
       String session = userinfo.getsessionId();
       Map<String,String> resp = ComparisonController.restGet(); 
       return resp;
    }

}