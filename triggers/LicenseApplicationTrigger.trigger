trigger LicenseApplicationTrigger on LicenseApplication__c (after insert) {

    PortalAdminService.processPortalAdmin(Trigger.new);

}