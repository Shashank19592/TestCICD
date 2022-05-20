public class StringArrayTest {
    public static List<String> generateStringArray(Integer i){
        List<String> liststring = new List<String>();
        for(Integer k=1;k<=i;k++){
            liststring.add('Test'+k);
        }    
        return liststring;
    }
}