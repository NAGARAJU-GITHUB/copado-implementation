@istest
public with sharing class AccountManagerTest {

@istest
public static void doGet()
{
Account record = createAccount();
RestRequest request = new RestRequest();// Set request properties
request.requestUri ='https://na59.salesforce.com/services/apexrest/Accounts/'+record+'/contacts';
request.httpMethod = 'GET';
RestContext.request = request;

}
@istest
public static Account createAccount()
{
	Account acct = new Account (Name = 'Accenture1');
	insert acct;
	Contact con  = new Contact (LastName = 'Raj',accountId=acct.id);
	insert con;
    return acct;
}
}