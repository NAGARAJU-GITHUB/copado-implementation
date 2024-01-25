public with sharing class BoatSearchResults {
    @AuraEnabled
    public static List<Boat__c> getBoats(String boatTypeId){ 
        List<Boat__c> boats = new List<Boat__c>();
        if(String.isEmpty(boatTypeId)){
            boats = [Select Id,Name,BoatType__c,Contact__r.Name,Picture__c,Geolocation__Latitude__s,Geolocation__Longitude__s From Boat__c];
            return boats;
        }
        else {
            Id myId = Id.valueOf(boatTypeId);
            boats = [Select Id,Name,BoatType__c,Contact__r.Name,Picture__c,Geolocation__Latitude__s,Geolocation__Longitude__s From Boat__c where BoatType__c=:myId];
            return boats;     
        }
            
    }
}