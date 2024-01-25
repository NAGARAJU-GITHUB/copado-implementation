public class AccController {
    
    @AuraEnabled
    public static List<Account> getAllAccount()
    {
        return[Select Name, Phone, Type from Account];
    }
    @AuraEnabled
    public static List<Account> getProspectAccount()
    {
        return[Select Name, Phone, Type from Account where Type='Prospect'];
    }

}