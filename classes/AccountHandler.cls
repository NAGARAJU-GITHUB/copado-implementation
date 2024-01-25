public with sharing class AccountHandler {
    public static Account insertNewAccount(String accName)
    {
        Account acc = new Account(Name = accName); 
      try
      {
        insert acc;
      }
      catch (DmlException e)
      {
        System.debug('Account name cannot be empty');
        acc = null;
      }
      return acc;
    }
    public AccountHandler() {

    }
}