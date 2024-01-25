public class RandomContactFactory {

	public static List<Contact> generateRandomContacts(Integer numberofcontacts, String lname) {

		List<Contact> con = new List<Contact>();
		for(Integer i=0;i<numberofcontacts;i++)
		{
			con.add(new Contact(FirstName = 'Test'+i, Lastname = lname));
		}

		return con;
	}
}