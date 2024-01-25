public class ViewContactController {
    @AuraEnabled
    public static List<Contact> contactView(ID accountId)
    {
        return[SELECT NAME,Email,MobilePhone FROM Contact where AccountId =:accountId];
    }
}