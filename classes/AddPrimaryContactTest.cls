@istest
public class AddPrimaryContactTest {
	@testsetup
	public static void setup() {
		List<Account> accounts = new List<Account>();
		  for (Integer i = 0; i < 50; i++){
			  accounts.add(new Account(name = 'acc' + i, BillingState = 'NY')); 
			  }
        for (Integer i = 50; i < 100; i++){
			accounts.add(new Account(name = 'acc' + i, BillingState = 'CA')); 
			}
        insert accounts;
	}
	static testmethod void testQueueable() {
        String state = 'CA';
		Contact con = new contact(FirstName='Senthil', LastName='Rajan');
        AddPrimaryContact updater = new AddPrimaryContact(con, state);
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();        
        
    }
}