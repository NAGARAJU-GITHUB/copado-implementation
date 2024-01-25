public class CheckTrainschedule {

public static void addTrain()
{
List <Train__c> Tra = new List<Train__c>();
List <Train_Schedule__c> tras = new List<Train_Schedule__c>();

	for (Integer i = 0; i < 50 ; i++)
	{
	   tra.add(new Train__C(Train_name__C = 'Train'+ i));
	}
	Insert Tra;

	for (Integer i = 0; i < 50 ; i++)
	{
	   tras.add(new Train_Schedule__c(Name = 'Train Schedule'+ i,Train__c = tra[i].Id));
	}
	Insert tras;
}

}