@istest
private class MaintenanceRequestTest {
    @istest
    public static Case createMaintenaceRequest()
    {
        Case testCase = new Case();
        Date newDate = Date.today();
        testCase.Type = 'Routine Maintenance';
        testCase.Status = 'New';
        testCase.Origin = 'Email'; 
        testCase.Date_Reported__c = Date.today();
        testCase.Subject = 'Routine Maintenance';
        testCase.Vehicle__c = 'a0Ef400000sf3BFEAY';
        testCase.Equipment__c = '01tf4000004BaxAAAS';
        testCase.Date_Due__c = newDate.addDays(90);
        insert testCase;
        return testCase;
    }
    @istest
    public static void updateMaintenanceRequest()
    {
        Case cas = createMaintenaceRequest();
        cas.Status = 'Closed';
        update cas;
    }
}