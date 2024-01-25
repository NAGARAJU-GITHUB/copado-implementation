global class AccountProcessor {
	@future
	public static void countContacts(Set<Id> recordIds) {

		List<Account> a = [Select Id,Number_of_Contacts__c,(Select Id From Contacts) from Account where Id IN :recordIds];
		List <Contact> con = a[0].contacts;
		a[0].Number_of_Contacts__c = con.size();
		update A;

	}
}