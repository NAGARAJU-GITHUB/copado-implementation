public class ContactController {
    
    @AuraEnabled
    public static String createContact(Contact con)
    {
        try
        {
            insert con;
            return 'Successfully Created'; 
        }catch(DMLException e)
        {
            return 'Failed'; 
        }
            
    }

}