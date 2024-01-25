@istest
public class AccountProcessorTest {
	@istest
	public static void ProcessorTest() {
	 Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        Contact cont = New Contact();
        cont.FirstName ='Bob';
        cont.LastName ='Masters';
        cont.AccountId = a.Id;
        Insert cont;
	  set<Id> setAccId = new Set<ID>();
        setAccId.add(a.id);
	  Test.startTest();
      AccountProcessor.countContacts(setAccId);
	  Test.stopTest();
	  
	}
}