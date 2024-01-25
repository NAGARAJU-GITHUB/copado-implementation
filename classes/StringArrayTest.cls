public with sharing class StringArrayTest {
    public static List<String> generateStringArray(Integer i)
    {
        List<String> test = new List<String>();
        for (Integer j = 0; j < i; j++) {
            test.add('Test '+ j);
        }
        System.debug(test);
        return test;   
    }

}