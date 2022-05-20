@RestResource (urlMapping='/AppService/*')
global class BaseApplicationServices implements IBaseAppicationServices{

    @HttpPost
    webservice static BaseApplicationWrapperObj invokeService(ApplicationWrapperObj appWrapperObj){

        /* Get Context objects in order to read parameters like url, cookies */
        BaseApplicationWrapperObj responseObj = null;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String svcName = null;
        String requestBodySerializedMap = '';
        if(null!=req){
            svcName = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1); /* Read service name from URL in order to invoke specific service method */
        }
        else{
            svcName = appWrapperObj.serviceName;
        }

        try{
        	
            if(!Utility.isEmpty(svcName)){

                if(svcName.equals(AppConstants.SVC_INSERT_ACC)){
                    //AccountServiceController accController = new AccountServiceController();
                    //responseObj = (BaseApplicationWrapperObj)accController.insertAccount(appWrapperObj);
                }
                if(svcName.equals(AppConstants.SVC_SEARCH_CON)){
                    //SearchHelper searchHelperObj = new SearchHelper();
                    //responseObj = searchHelperObj.searchRecords(appWrapperObj);
                }
                if(svcName.equals(AppConstants.SVC_EMAIL_DOMAIN_GET)){
                    //appWrapperObj.retListFromServer = UtilityHelper.getEmailDomainList();
                    //responseObj = appWrapperObj;
                }
                if(svcName.equals(AppConstants.SVC_EMAIL_DOMAIN_UPDATE)){
                    //appWrapperObj.retListFromServer = UtilityHelper.processNewEmailDomainList(appWrapperObj.postListToServer);
                    //responseObj = appWrapperObj;
                }
            }            
            else{/* Case of invalid service requested */
                responseObj = handleInvalidSvcNameReq( responseObj );
            }

        }
        catch(BaseServiceException baseAppEx){
            BaseServiceException.resolveExceptions(baseAppEx.getMessage(),baseAppEx);
            responseObj = constructResponseBody( responseObj, baseAppEx );
        }
        catch(Exception ex){
            BaseServiceException.resolveExceptions('Exception occured: BaseApplicationServices : invokeService method ',ex);
            responseObj = constructResponseBody( responseObj, ex );
        }
        return responseObj;

    }
    /* Uses out error codes/messages from exception object and updates the same to BaseApplicationWrapperObj which is sent as response for the service call */
    
    
    public static BaseApplicationWrapperObj constructResponseBody(BaseApplicationWrapperObj responseObj, Object exceptionObj ){
        if(Utility.isEmpty(responseObj)) responseObj = new ApplicationWrapperObj();
        if( exceptionObj instanceOf BaseServiceException || exceptionObj instanceOf Exception) {
            responseObj.message   = AppConstants.ERROR_MSG_UNEXPECTED_ERROR_OCCURED;
            responseObj.errorCode = AppConstants.RESPONSE_FAILURE_ERROR_CODE;

        }
        return (BaseApplicationWrapperObj)responseObj;
    }

    /* Updates error code and error message for invalid service name cases */
   
    public static BaseApplicationWrapperObj handleInvalidSvcNameReq(BaseApplicationWrapperObj responseObj){
        if(Utility.isEmpty(responseObj)) responseObj = new ApplicationWrapperObj();
        responseObj.errorCode   =   AppConstants.RESPONSE_FAILURE_ERROR_CODE;
        responseObj.message     =   AppConstants.SVC_RESP_MESSAGE_INVALID_SVCNAME;
        return (BaseApplicationWrapperObj)responseObj;
    }
    
    /* Creates a serialized map string of the request JSON */
    
    public static String createSerializedMapString(String serviceJSONObjectasString){
        String requestBodySerializedMap = '';
        try{
            if(!Utility.isEmpty(serviceJSONObjectasString)){
                Map<String, Object> mapOfJSONData = (Map<String, Object>) JSON.deserializeUntyped(serviceJSONObjectasString);
                for(String str : mapOfJSONData.KeySet())
                {
                    Object obj = mapOfJSONData.get(str);
                    requestBodySerializedMap = JSON.serialize(obj);
                }                
            }
        }       
        catch(JSONException ex){
            throw new BaseServiceException(
            'Exception occured: BaseApplicationServices : createSerializedMapString method ', ex);
        }
        return requestBodySerializedMap;
    }


}