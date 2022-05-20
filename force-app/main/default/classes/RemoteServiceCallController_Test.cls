@istest (SeeAllData = true)
public class RemoteServiceCallController_Test{
    public static String serviceJSONObject;
    public static String serviceName;
    public static String requestType;
    public static String urlParameter;

    public static Testmethod void MyTest(){
    
    //RemoteServiceCallController remServiceCall = new RemoteServiceCallController();
    RemoteServiceCallController.invokeService(serviceJSONObject,serviceName,requestType);
    RemoteServiceCallController.invokeServiceWithURLParameter(serviceJSONObject,serviceName,requestType,urlparameter);
    RemoteServiceCallController.constructRequestBody(serviceJSONObject,serviceName,requestType,urlparameter);
    
    }
}