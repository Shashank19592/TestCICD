public class StaticTest {
    
    public Integer Test=10;
    public static final Integer Test2=20;
    
    public StaticTest(){
        System.debug(this.Test);
        System.debug(Test2);
    }
    
    public void StaticTestMethod(){
        System.debug(this.Test);
        System.debug(Test2);
    }
    

}