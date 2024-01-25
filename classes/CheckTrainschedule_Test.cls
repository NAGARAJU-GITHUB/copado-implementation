@isTest
private class CheckTrainschedule_Test{
  @testSetup
  static void setupTestData(){
    test.startTest();
    Train__c train_Obj = new Train__c(Train_Name__c = 'Train658');
    Insert train_Obj; 
    test.stopTest();
  }
  static testMethod void test_addTrain_UseCase1(){
    List<Train__c> train_Obj  =  [SELECT Name,Train_Name__c from Train__c];
    System.assertEquals(true,train_Obj.size()>0);
    CheckTrainschedule obj01 = new CheckTrainschedule();
    CheckTrainschedule.addTrain();
  }
}