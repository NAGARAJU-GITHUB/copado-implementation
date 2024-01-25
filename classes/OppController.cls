public class OppController {
    @AuraEnabled
    public static List<Opportunity> getAllOpportunities()
    {
        return[Select Name, StageName, Amount from Opportunity];
    }
    @AuraEnabled
    public static List<Opportunity> getWonOpportunities()
    {
        return[Select Name, StageName, Amount from Opportunity where StageName='Closed Won'];
    }

}