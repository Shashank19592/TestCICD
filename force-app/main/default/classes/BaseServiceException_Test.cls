@istest(seeAlldata = true) 
public with sharing class BaseServiceException_Test {
public static Testmethod void DatabaseServiceUpsertMethodTest(){
         Test.startTest();
    		BaseServiceException.resolveExceptions('Hi',new BaseServiceException(
            'Exception occured: AccountServiceController : insertAccount method '));
            BaseServiceException.resolveExceptions(new BaseServiceException(
            'Exception occured: AccountServiceController : insertAccount method '));
            BaseServiceException.resolveExceptions('Hi',new BaseServiceException(
            'Exception occured: AccountServiceController : insertAccount method '),'Hello');
    Test.stopTest();
}
}