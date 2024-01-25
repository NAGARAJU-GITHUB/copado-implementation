@istest
private class ClosedOpportunityTrigger_Test {
	@istest
	private static void Oppcheck()  {
		Opportunity o = new Opportunity(Name = 'Test1234',Stagename='Closed Won', CloseDate=System.today().addMonths(1));
		insert o;
	}
}