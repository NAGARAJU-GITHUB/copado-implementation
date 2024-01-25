global class LeadProcessor implements Database.Batchable<sObject> {

	global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'Select ID From Lead'
        );
    }

	global void execute(Database.BatchableContext bc, List<Lead> scope)
	{
		List<Lead> lead = new List<Lead>();
		for(Lead l: scope)
		{
           l.LeadSource = 'Dreamforce';
		   lead.add(l);
		}	
		update lead;
	}
	
	 global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    } 
}