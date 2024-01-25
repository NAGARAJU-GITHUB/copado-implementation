public with sharing class BoatSearchFormController {
    @AuraEnabled
    public static List<BoatType__c> getItems()
    {
        return [Select Id,Name from BoatType__c];
    }
}