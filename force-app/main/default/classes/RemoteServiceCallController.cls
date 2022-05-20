global with sharing class RemoteServiceCallController {
    
    @remoteAction
    public static String invokeService(String serviceJSONObject,String serviceName,String requestType) {        
        BaseApplicationWrapperObj responseObj = null;   
        
        try{
            responseObj = BaseApplicationServices.invokeService(constructRequestBody(serviceJSONObject, serviceName, requestType,''));
        }
        catch(BaseServiceException baseAppEx){
        }
        return JSON.serialize(responseObj);
    }
    @remoteAction
    public static String invokeServiceWithURLParameter(String serviceJSONObject,String serviceName,String requestType,String urlParameter) {
        BaseApplicationWrapperObj responseObj = null; 
        try{
            responseObj =   BaseApplicationServices.invokeService(constructRequestBody(serviceJSONObject, serviceName, requestType,urlParameter));
        }
        catch(BaseServiceException baseAppEx){
        }
        return JSON.serialize(responseObj);
    }
    @TestVisible
    private static ApplicationWrapperObj constructRequestBody(String serviceJSONObject,String serviceName,String requestType,String urlParameter){
        ApplicationWrapperObj appWrapperObj = new ApplicationWrapperObj();
        try{
            appWrapperObj.serviceJSONObjectasString = serviceJSONObject;
            appWrapperObj.serviceName = serviceName;
            appWrapperObj.requestType = requestType;
            appWrapperObj.urlParameters = urlParameter;
        }catch(BaseServiceException baseAppEx){ 
            throw new BaseServiceException('Exception occured: RemoteServiceCallController : constructRequestBody method ',baseAppEx);
        }        
        return appWrapperObj;
    }

}