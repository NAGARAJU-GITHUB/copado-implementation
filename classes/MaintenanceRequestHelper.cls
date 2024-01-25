public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<Case> mr) {
        List<ID> newMr = new List<ID>();
        List<Case> mrList = new List<Case>();
        for(Case c: mr)
        { 
            if(c.Type == 'Routine Maintenance' && c.status == 'Closed')
            {
               newMr.add(c.Id);
               mrList.add(c);
            }
        }
        createCase(newMr,mrList);
        
    }       
	private static void createCase(List<ID> newMr,List<Case> mrList)
    {
     List<Work_Part__c> wp = getWorkpart(newMr);
     List<Case> maintenanceRequest = new List<Case>();
         for(Case c : mrList)
         {
            Case newMaintencerequest = new Case();
            Date newDate = Date.today();
            //Decimal days = wp.Equipment__r.Maintenance_Cycle__c;
            newMaintencerequest.Type = 'Routine Maintenance';
            newMaintencerequest.Status = 'New';
            newMaintencerequest.Origin = 'Email'; 
            newMaintencerequest.Date_Reported__c = Date.today();
            newMaintencerequest.Subject = 'Routine Maintenance';
            newMaintencerequest.Vehicle__c = c.Vehicle__c;
            newMaintencerequest.Equipment__c = c.Equipment__c;
            newMaintencerequest.Date_Due__c = newDate.addDays(90);
            maintenanceRequest.add(newMaintencerequest);
         }
        insert maintenanceRequest;
        
    }
    private static List<Work_Part__c> getWorkpart(List<ID> newMr)
    {
        List<Work_Part__c> wp = [Select Id,Name,Equipment__r.Maintenance_Cycle__c From Work_Part__c Where Maintenance_Request__c IN :newMr];
        
        return wp;
    }
}