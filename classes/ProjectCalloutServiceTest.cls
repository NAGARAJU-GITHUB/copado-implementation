@isTest
private class ProjectCalloutServiceTest {
  //Implement mock callout tests here
  @isTest
  public static void testCallout()
  {
    Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMock());
    updateOpportunity();

  }
  public static void updateOpportunity()
  {
    ServiceTokens__c token = new ServiceTokens__c();
    token.name = 'ProjectServiceToken';
    token.Token__c = 'Test Token';
    insert token;
    Opportunity opp = new Opportunity(Name ='Test',StageName = 'Closed Won',Type = 'New Project',CloseDate = Date.today());
    Insert opp;
  }
}