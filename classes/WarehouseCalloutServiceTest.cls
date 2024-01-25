@IsTest
private class WarehouseCalloutServiceTest {
    // implement your mock callout test here
    @istest
    public static void testCallout()
    {
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }

}