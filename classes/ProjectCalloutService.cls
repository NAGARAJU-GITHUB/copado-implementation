public class ProjectCalloutService 
{
    //Complete the implementation for business and callout logic
    
    
    @InvocableMethod(label='Post Opportunity To PMS')
    public static void postOpportunityToPMS(List<ID> ids)
    {
        getOpportunity(ids);
    }
    public static void getOpportunity(List<ID> oppIds)
    {
        List<Opportunity> opp = [Select Id,Name,Account.Name,CloseDate,Amount from Opportunity where Id =:oppIds];
        OppRequest oppReq = new OppRequest(opp[0]);
        String JSONString = JSON.serialize(oppReq);

        System.enqueueJob(new QueueablePMSCall(opp[0],JSONString));
    }
    public class OppRequest
    {
        String opportunityId;
        String opportunityName;
        String accountName;
        Date closeDate;
        Decimal amount;

        public OppRequest(Opportunity opp)
        {
            this.opportunityId = opp.Id;
            this.opportunityName = opp.Name;
            this.accountName = opp.Account.Name;
            this.closeDate = opp.CloseDate;
            this.amount = opp.Amount;
        }
    }
    public class QueueablePMSCall implements System.Queueable,Database.AllowsCallouts
    {
        private String jsonString;
        private Opportunity opp;
        
        public QueueablePMSCall (Opportunity opp,String jsonString)
        {
            this.jsonString = jsonString;
            this.opp = opp;
            
        }
        public void execute(QueueableContext context) 
        {
            pmsCallout(opp,jsonString);
               
       }
    }
    public static void  pmsCallout(Opportunity opp,String jsonString)
    {
        HttpRequest req = new HttpRequest();
        String currentToken = ServiceTokens__c.getInstance('ProjectServiceToken').Token__c;
        req.setEndpoint('callout:ProjectService');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Token', currentToken);
        req.setBody(jsonString);
        Http h = new Http();
        HttpResponse res = h.send(req);
        System.debug('Status Code ' + res.getStatusCode());
        
       /* if(res.getStatusCode() == 201 && res.getStatus() == 'OK')
        {
        opp.StageName = 'Submitted Project';
        }
        else if(res.getStatusCode() == 500)
        {
        opp.StageName = 'Resubmit Project';
        }
        update opp; */
    }
}