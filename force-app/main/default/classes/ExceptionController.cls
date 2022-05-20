public class ExceptionController {
	
    @AuraEnabled
    public static void LogException(JavascrptException e){
        System.debug(e);
    }
    
    public class JavascrptException extends Exception{
        string Message;
        string Stacktrace;
    }
}