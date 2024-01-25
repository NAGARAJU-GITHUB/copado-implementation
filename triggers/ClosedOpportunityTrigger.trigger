trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

 List<OpportunityTeamMember> tas = new List<OpportunityTeamMember> ();

    for (Opportunity so : Trigger.new) {
        if(so.StageName == 'Needs Analysis')
        {
          System.debug('Insert Team Member ' +UserInfo.getUserName());
          tas.add(new OpportunityTeamMember(TeamMemberRole = 'Pre-Sales Consultant',OpportunityId = so.Id,UserId='005f4000003iG7YAAU',OpportunityAccessLevel ='Owner'));
        }
        
    }

    insert tas;

}