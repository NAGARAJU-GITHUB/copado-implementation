@istest
public with sharing class WarehouseSyncScheduleTest {
    
    @istest 
    public static void testSchedule()
    {
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        System.schedule('EquipmentSyncScheduleTest', CRON_EXP, new WarehouseSyncSchedule());
    }
}