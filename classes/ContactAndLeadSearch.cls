public with sharing class ContactAndLeadSearch {

    public static List<List<SObject>> searchContactsAndLeads(String contactName)
    {
        List<List<SObject>> searchList = [FIND :contactName IN ALL FIELDS RETURNING Lead(LastName), Contact(LastName)];
        return searchList;
    }
    public static void insertLeadAndContact()
    {
        lead l = new lead(LastName = 'Smith');
        contact con = new contact(LastName = 'Smith');
        insert l;
        insert con;
        System.debug(l + ' ' + con);
    }
    public ContactAndLeadSearch() {

    }
}