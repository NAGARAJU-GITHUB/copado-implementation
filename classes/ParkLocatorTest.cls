@istest
private class ParkLocatorTest {
    @istest static void testCallout()
    {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String [] result = ParkLocator.country('India');
        String [] parks  = new String[]{'Hamburg Wadden Sea National Park'};
        System.assertEquals(parks, result); 
    }

}