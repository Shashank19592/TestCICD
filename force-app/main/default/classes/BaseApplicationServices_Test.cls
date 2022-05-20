@isTest
public with sharing class BaseApplicationServices_Test {
	
	 static testmethod void invokeTest(){
        
        /*String jsonInput1 = '{\n' +
    						' "description" :"An appliance",\n' +
   							' "accessories" : [ "powerCord", ' + 
     						'{ "right":"door handle1", ' + 
       						'"left":"door handle2" } ],\n' +
   							' "dimensions" : ' + 
      						'{ "height" : 5.5 , ' + 
        					'"width" : 3.0 , ' + 
					        '"depth" : 2.2 },\n' +
					    	' "type" : null,\n' +
						    ' "inventory" : 2000,\n' +
						    ' "price" : 1023.45,\n' +
						    ' "isShipped" : true,\n' +
						    ' "modelNumber" : "123"\n' +
						    '}';*/
						    
        String jsonInput = '{"OrderRequest":{"AccountId":"001L000000WadfuIAB","ContactId":"003L000000QWwKHIA1","FunctionType":"GuestPass","SalesChannel":"Lobby","ProcessCreditCard":false,"DonorInformation":{"Type":"Primary","Suffix":null,"State":"OR","SendEmailOffers":null,"PurchaseReceiptEmailId":"ncmsec@gmail.com","Prefix":"Mr.","PostalCodeExtension":null,"PostalCode":"97701","MiddleName":"","MemberNumber":"40316154","MemberCalendarPreference":"Direct Mail","LastName":"28secondary","HomePhone":"1234567890","FirstName":"Cmtest5","ExpirationDate":"2015-10-31","EmailAddress":"ncmsec@gmail.com","DOB":null,"DAnonymous":null,"Country":"United States","ContactId":"003L000000QWwKHIA1","City":"Bend","CategoryCode":"7","BusinessPhone":null,"AddressLine2":null,"AddressLine1":"SW Gift Rd","AccountId":"001L000000WadfuIAB"},"Memberships":[],"PaymentInfo":{"AccountNumber":null,"Amount":10,"CardAddress1":null,"CardCVV2Code":null,"CardExprMonth":null,"CardExprYear":null,"CardholderName":null,"CardType":null,"CardZipCode":null,"ClientAuthorization":null,"ClientTransNumber":null,"PayType":"Checks/Cash","PromotionCode":null,"TransactionNumber":null,"CashTendered":"10"},"Donations":null,"GuestPass":{"TotalGuestPassCost":10,"TemporaryPassInfo":[{"BarCode":"M4031615400001"}],"SubFuncType":"GuestPass;TemporaryPass;ChildFreePass","GuestPassInfo":{"ProductCode":"TKTGP","NumberOfUnits":2},"GuestPassCost":5,"FunctionType":"GuestPass","ChildFreePassInfo":{"ProductCode":"TKTCH","NumberOfUnits":2}}}}';
        ApplicationWrapperObj remoteServCallObj = constructRequestBody(jsonInput, 'Process Order', 'POST', 'TesturlParameter');
    	ApplicationWrapperObj remoteServCallObj2 = constructRequestBody(jsonInput, 'Email Service', 'POST', 'TesturlParameter');
    	ApplicationWrapperObj remoteServCallObj3 = constructRequestBody(jsonInput, 'Barcode Update', 'GET', 'TesturlParameter');
    	ApplicationWrapperObj remoteServCallObj4 = constructRequestBody(jsonInput, 'Lobby Initialization', 'GET', 'TesturlParameter');
    	ApplicationWrapperObj remoteServCallObj5 = constructRequestBody(jsonInput, 'Lobby Search', 'GET', 'TesturlParameter');
    	ApplicationWrapperObj remoteServCallObj6 = constructRequestBody(jsonInput, 'Cart Service', 'POST', 'TesturlParameter');
    	ApplicationWrapperObj remoteServCallObj7 = constructRequestBody(jsonInput, 'Membership Renewal', 'POST', 'TesturlParameter');
    	ApplicationWrapperObj remoteServCallObj8 = constructRequestBody(jsonInput, 'Card Reprint Service', 'POST', 'TesturlParameter');
    	ApplicationWrapperObj remoteServCallObj9 = constructRequestBody(jsonInput, 'Promotion Discount Helper', 'POST', 'TesturlParameter');
    	ApplicationWrapperObj remoteServCallObj10 = constructRequestBody(jsonInput, 'Wrong Service', 'POST', 'TesturlParameter');
    	Test.startTest();
    	try{
	        BaseApplicationServices.invokeService(remoteServCallObj);
            BaseApplicationServices.createSerializedMapString(jsonInput);
	    }catch(BaseServiceException ex)   {} 
	    try{
	        BaseApplicationServices.invokeService(remoteServCallObj2);
	        }catch(BaseServiceException ex)   {}
	    try{
	    	
	        BaseApplicationServices.invokeService(remoteServCallObj3);
	        }catch(BaseServiceException ex)   {}
	    try{
	        BaseApplicationServices.invokeService(remoteServCallObj4);
	    }catch(BaseServiceException ex)   {}
	    	
	    try{
	        BaseApplicationServices.invokeService(remoteServCallObj5);
	    }catch(BaseServiceException ex)   {}
	    	
	    try{
	        BaseApplicationServices.invokeService(remoteServCallObj6);
	    }catch(BaseServiceException ex)   {}
	    try{
	        BaseApplicationServices.invokeService(remoteServCallObj7);
	    }catch(BaseServiceException ex)   {}
	    try{
	        BaseApplicationServices.invokeService(remoteServCallObj8);
    	}catch(BaseServiceException ex)   {} 
    	try{
	        BaseApplicationServices.invokeService(remoteServCallObj9);
    	}catch(BaseServiceException ex)   {} 
    	try{
	        BaseApplicationServices.invokeService(remoteServCallObj10);
	        BaseApplicationServices.constructResponseBody(remoteServCallObj10,new BaseServiceException());
    	}catch(BaseServiceException ex)   {} 
        Test.stopTest();
    }
    
    
    private static ApplicationWrapperObj constructRequestBody(String serviceJSONObject,String serviceName,String requestType,String urlParameter){
    	ApplicationWrapperObj serviceCallObj = new ApplicationWrapperObj();
    	try{
	    	serviceCallObj.serviceJSONObjectasString = serviceJSONObject;
	    	serviceCallObj.serviceName = serviceName;
	    	serviceCallObj.requestType = requestType;
	    	//serviceCallObj.urlParam = urlParameter;
	    	//serviceCallObj.memberNumber = '45678932';
    	}catch(BaseServiceException baseAppEx){ 
        	throw new BaseServiceException('Exception occured: RemoteServiceCallController : constructRequestBody method ',baseAppEx);
    	}
    	
    	return serviceCallObj;
    }
    
    
     static testmethod void testHandleInvalidSvcNameReq(){
        //REST_ProcessOrder_V1.ProcessOrderResponse orderResponse = new REST_ProcessOrder_V1.ProcessOrderResponse();
        ApplicationWrapperObj responseObj = new ApplicationWrapperObj();
        BaseApplicationServices.handleInvalidSvcNameReq(responseObj);
        	
     } 

}