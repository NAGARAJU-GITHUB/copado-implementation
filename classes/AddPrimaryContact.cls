public class AddPrimaryContact implements Queueable{
    private Contact contact;
	private String state;
	public AddPrimaryContact(Contact con, String state) {
		this.contact = con;
		this.state = state;
	}
	public void execute(QueueableContext context) {
        List<Account> acct = new List<Account>();
		List<Contact> c1 = new List<Contact>();
		acct = [SELECT ID, Name FROM ACCOUNT WHERE BillingState = :state LIMIT 200];
		for(Account a: acct)
		{
		 Contact c = contact.clone(false,false,false,false);
		 c.accountid = a.Id;
		 c1.add(c);
		}
    }
}