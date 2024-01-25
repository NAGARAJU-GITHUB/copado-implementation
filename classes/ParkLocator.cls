public with sharing class ParkLocator {
    public static String[] country(String country)
    {
        ParkService.ParksImplPort ps = new ParkService.ParksImplPort();
        String [] parks = ps.byCountry(country);
        return parks;
    }

}