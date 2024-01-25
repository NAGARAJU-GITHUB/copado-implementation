public with sharing class ComparisonController {
    
    public static String fetchUserSessionId() 
	{
         String sessionId = '';
         // Refer to the Page
         PageReference reportPage = Page.GetSessionVF;
         // Get the content of the VF page
         String vfContent = reportPage.getContent().toString();
         // Find the position of Start_Of_Session_Id and End_Of_Session_Id
         Integer startP = vfContent.indexOf('Start_Of_Session_Id') + 'Start_Of_Session_Id'.length(),
         endP = vfContent.indexOf('End_Of_Session_Id');
         // Get the Session Id
         sessionId = vfContent.substring(startP, endP);
         // Return Session Id
         return sessionId;
    }
    
    @AuraEnabled
	public static Map<String,String> restGet() 
	{
    String baseURL = URL.getSalesforceBaseUrl().toExternalForm();
	String endPoint = baseURL + '/services/data/v43.0/tooling/query?q=Select+Id,+DeveloperName,+TableEnumOrId+from+CustomField';
    String sid = fetchUserSessionId();
    Map<String, String> customField = new Map<String, String>();
    Http h = new Http();
    HttpRequest hr = new HttpRequest();
    hr.setHeader('Authorization', 'Bearer ' + sid);
    hr.setTimeout(60000);   
    hr.setEndpoint(endPoint);   
    hr.setMethod('GET');
    HttpResponse r = h.send(hr); 
    //system.debug(r.getBody());
    JSONParser parser = JSON.createParser(r.getBody());
        While(parser.nextToken() != null)
        {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'DeveloperName')) {
                parser.nextToken();
                String field = parser.getText();
                parser.nextToken();
                parser.nextToken();
                String obj = parser.getText();
                Map<String,String> cf = new Map<String, String>();
                cf.put(field,obj);
                customField.putAll(cf);
            }
        }
    return customField; 
   }

}