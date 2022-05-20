@isTest
public class UtilityHelper_Test {
	public static Testmethod void MyTest(){
        List<String> newEmailIdList = new List<String>();
        newEmailIdList.add('rp@g.com');
        newEmailIdList.add('ms@gmail.com');
        newEmailIdList.add('d@m.com');
        EmailDomainList__c emailDomainObj = new EmailDomainList__c();
		emailDomainObj.name = 'p.com';
		emailDomainObj.DomainName__c = 'p.com';
        insert emailDomainObj;
    	Test.startTest();
        UtilityHelper.processNewEmailDomainList(newEmailIdList);
        try{
            newEmailIdList.add('m.com');
            UtilityHelper.processNewEmailDomainList(newEmailIdList);
        }catch(BaseServiceException e){}
        Test.stopTest();
    }
}