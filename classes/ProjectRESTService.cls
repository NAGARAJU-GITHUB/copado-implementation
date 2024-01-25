@RestResource (urlMapping = '/project/*')
global class ProjectRESTService {
    //Implement service logic here'
    @HttpPost
    global static String postProjectData(String projectRef,String projectName,String opportunityId
                                            ,Date startDate,Date endDate,Double amount,String status)
    {
        Savepoint sp = Database.setSavepoint();
        Project__c project = new Project__c();
        project.Name = projectName;
        project.ProjectRef__c = projectRef;
        project.Opportunity__c = opportunityId;
        project.Start_Date__c = startDate;
        project.End_Date__c = endDate;
        project.Billable_Amount__c = amount;
        project.Status__c = status;
        try {
        upsert project;

        Opportunity opp = [Select Id from Opportunity where Id =:opportunityId Limit 1];

        opp.DeliveryInstallationStatus__c = 'In Progress';
        update opp;
        return 'OK';
        } catch (Exception e) {
            Database.rollback(sp);
            return e.getMessage();
        }
       
    }
}