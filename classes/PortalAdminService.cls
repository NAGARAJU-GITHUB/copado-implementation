public with sharing class PortalAdminService {
    
    public static void processPortalAdmin(List<LicenseApplication__c> licenseAppication)
    {
        System.debug('Future call begins');
        processPortalAdminService(licenseAppication[0].Id);
    }

    @future
    public static void processPortalAdminService(ID licenseApplicationId)
    {
        List<LicenseApplication__c> licenseApplication = [Select ID,Name from LicenseApplication__c where Id =:licenseApplicationId];

        PortalAdminRequest__c portalAdminReq = new PortalAdminRequest__c();
        portalAdminReq.Name = 'Test'; 
        portalAdminReq.status__c = 'Draft';
        insert portalAdminReq; 
  
        System.debug('License application ID ' + licenseApplicationId);
        System.debug('Portal Admin Request ' + portalAdminReq);

        for(LicenseApplication__c la: licenseApplication)
        {
            if(la.Name == 'Second Application')
            {
                portalAdminReq.status__c = 'Approved';
                update portalAdminReq;
            }
        }
        System.debug('Portal Admin Request ' + portalAdminReq);
    }
}