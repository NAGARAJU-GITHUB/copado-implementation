public class AccountSearchController {
    @AuraEnabled
    public static List<Account> getAllAccount(String name)
    {
        List<List<SObject>> searchList = [FIND :name IN ALL FIELDS RETURNING Account(Name,Site,ShippingAddress,OwnerId)];
        Account[] searchAccounts = (Account[])searchList[0];
        return searchAccounts;
    }

}