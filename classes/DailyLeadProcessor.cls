global class DailyLeadProcessor implements Schedulable{
	global void execute(SchedulableContext ctx) {

		List<Lead> lead = [Select ID from Lead where LeadSource='' LIMIT 200];
		for(Lead l:lead)
		{
			l.LeadSource = 'Dreamforce';
		}
        
    }
}