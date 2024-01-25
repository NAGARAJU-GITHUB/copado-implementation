public class BillingCalloutService {
    //Implement business and callout logic methods here
    
    public static void getProjectdetails (List<Project__c> project)
    {
        
        if (project.size() > 0 && project.size() < 2 && project[0].Status__c == 'Billable')
        {
            ID id = project[0].id;
            callBillingService(id);
        }
        
    }
    @future(callout = true)
    public static void callBillingService(ID projectId)
    {
        Project__c project = [Select ProjectRef__c,Billable_Amount__c from Project__c Where Id =:projectId];
        BillingServiceProxy.project pro = new BillingServiceProxy.project();
        pro.projectid = project.ProjectRef__c;
        pro.billAmount = project.Billable_Amount__c;
        pro.username = ServiceCredentials__c.getInstance('BillingServiceCredential').Username__c;
        pro.password = ServiceCredentials__c.getInstance('BillingServiceCredential').Password__c;
        BillingServiceProxy.InvoicesPortSoap11 invoice = new  BillingServiceProxy.InvoicesPortSoap11();
        String response = invoice.billProject(pro);
        callBillingServicesync(response,project);
    }
    public static void callBillingServicesync(String response, Project__c project)
    {
        List<Project__c> projectList = new List<Project__c>();
        Project__c pro = [Select Id from Project__c where Id =: project.id];
        if (response == 'Ok')
        {
            pro.Status__c = 'Billed';
            projectList.add(pro);
        }
        if(projectList.size() > 0)
        {
            update projectList;
        }
    }
}