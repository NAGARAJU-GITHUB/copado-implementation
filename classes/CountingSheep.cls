public with sharing class CountingSheep {
    public static void getSleep(Integer n)
    {
        Set<String> count = new Set<String>();
        Integer num;
        
        for(Integer i=1;i>0;i++)
        {
            if(count.size() < 10)
            {
                num = n*i;
                String str = String.valueOf(num);
                for(Integer k=0;k<str.length();k++)
                {
                    count.add(str.substring(k,k+1));
                }
            }
            else 
                {
                    break;
                }
            system.debug('I ' +i);
            }
            system.debug('Count ' +count);
            system.debug('Num ' +num);
        }
    }