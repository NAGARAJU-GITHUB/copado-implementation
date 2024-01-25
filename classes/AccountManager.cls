@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager  {
    @HttpGet
    global static void getAccount() {
        RestRequest request = RestContext.request;
        String accId = request.requestURI.substringBetween('Accounts/','/contacts');
        System.debug(accId);
        Account obj =  [SELECT Id,(Select Id,Name from Contacts)FROM Account WHERE Id = :accId];
        
    }
}