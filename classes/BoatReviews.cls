public with sharing class BoatReviews {
    @AuraEnabled
    public static List<BoatReview__c> getAll(ID boatId){
        List<BoatReview__c> boatReview = [Select Id,
                                                Name,
                                                Comment__c,
                                                Rating__c,
                                                LastModifiedDate,
                                                CreatedDate,
                                                CreatedBy.Name,
                                                CreatedBy.SmallPhotoUrl,
                                                CreatedBy.CompanyName 
                                                From BoatReview__c Where Boat__c =:boatId];
        return boatReview;
    }

}