@isTest
private class ProjectRESTServiceTest {
  //Implement Apex REST service tests here
  @isTest
  static void testpostProjectData()
  {
    Opportunity opp = new Opportunity(Name = 'Test',CloseDate = Date.today(),Type = 'New Customer',StageName = 'Prospecting');
    insert opp;
    Date startDate = Date.today();
    Date endDate = startDate.addDays(30);
    String result = ProjectRESTService.postProjectData('123','Test',opp.Id,startDate,endDate,1200,'Running');
    System.assertEquals('OK', result);
  }
  @isTest
  static void testpostProjectDatafailure()
  {
    Opportunity opp = new Opportunity(Name = 'Test',CloseDate = Date.today(),Type = 'New Customer',StageName = 'Prospecting');
    insert opp;
    Date startDate = Date.newInstance(17,02,2020);
    Date endDate = Date.newInstance(17,03,2020);
    String result = ProjectRESTService.postProjectData('123','Test',opp.Id,startDate,endDate,1200,'Running');
    system.assertNotEquals('Ok', result);
  }
}