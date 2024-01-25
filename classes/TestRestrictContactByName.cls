@istest
public class TestRestrictContactByName {
	@istest
	public static void contactname() {
		Contact c = new Contact(FirstName = 'Senthil', LastName = 'INVALIDNAME');
		insert c;
		
	}
}