global class ApplicationWrapperObj extends BaseApplicationWrapperObj{
    public String status {get;set;}
    public String serviceName {get;set;}
    public String urlParameters {get;set;}
    public String serviceJSONObjectasString{get;set;}
    public String requestType{get;set;}
    //public ApplicationWrapperExtn.searchOperationWrapper searchWrapperObj {get;set;}
    
    
    //The return type of the business functionality methods will be classes available in WrapperClassUtility    
    public WrapperClassUtility.TestWrapperClass testWrapperInstance {get;set;} 
    
}