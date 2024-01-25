@istest
public class LeadProcessorTest {
	@testsetup
	 static void setup() {
        List<Lead> lead = new List<Lead>();
        for (Integer i=0;i<200;i++) {
            lead.add(new Lead(LastName='Lead '+i, 
                Company='Accenture', Status='Closed - Converted'));
        }
        insert lead;
	 }
	  static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
    }
}