public class QueuableUpdateOpp implements System.Queueable{
    Opportunity opp;
    public QueuableUpdateOpp(List<Opportunity> oppList) {
        for(Opportunity opp1: oppList)
        {
            this.opp = opp1;
        }
        
    }
    public void execute(QueueableContext context) {
        opp.StageName = 'Closed Won';
        
    }
}