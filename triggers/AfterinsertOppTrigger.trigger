trigger AfterinsertOppTrigger on Opportunity (before update) {

    for(Opportunity opp: Trigger.new)
    {
        opp.StageName = 'Closed Won';
    }
    //System.enqueueJob(new QueuableUpdateOpp(Trigger.new));
}