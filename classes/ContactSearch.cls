public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String name, String postCode)
    {
        List<Contact> con = [Select Id,Name From Contact Where lastname =: Name and MailingPostalCode =: postCode];
        System.debug(con);
        return con;
        
    }
    public ContactSearch() {

    }
}