@isTest
private class BillingCalloutServiceTest {
  //Implement mock callout tests here
  @isTest
  public static void testCallout()
  {
    Test.setMock(WebServiceMock.class, new BillingCalloutServiceMock());
    ServiceCredentials__c cred = new ServiceCredentials__c();
    cred.Name = 'BillingServiceCredential';
    cred.Username__c = 'testuser';
    cred.Password__c = 'testpass';
    insert cred;
    Opportunity opp = new Opportunity(Name ='Test',StageName = 'Prospecting',Type = 'New Customer',CloseDate = Date.today());
    Insert opp;
    Project__c project = new Project__c(ProjectRef__c = '123',Billable_Amount__c = 15000,Status__c='Running',Opportunity__c = opp.id);
    Insert project;
    project.Status__c = 'Billable';
    Test.startTest();
    update project;
    Test.stopTest();
    
    //System.assertEquals('Ok', 'Ok');
  }
}