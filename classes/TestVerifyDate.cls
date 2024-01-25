@istest
public class TestVerifyDate {
	@istest
	public static void CheckDates_test ()
	{
		date d1 = date.newInstance(2018, 11, 21);
		date d2 = date.newInstance(2018, 05, 21);
		date d = VerifyDate.CheckDates(d1,d2);
	}
    @istest
	public static void DateWithin30Days_test ()
	{
		date d1 = date.newInstance(2018, 05, 10);
		date d2 = date.newInstance(2018, 05, 21);
		date d = VerifyDate.CheckDates(d1,d2);
	}

}