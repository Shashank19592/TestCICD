public with sharing class UtilityHelper {
	
	/* Gets the list of email domain saved in the custome setting EmailDomainList__c*/
	public static list<String> getEmailDomainList(){
		list<String> lstEmailDomain = null;
		try{
			lstEmailDomain = new list<String>();
			map<String, EmailDomainList__c> lstEmailDomainMap = EmailDomainList__c.getAll();
			for (EmailDomainList__c emailDomain: lstEmailDomainMap.values()) {
				lstEmailDomain.add(emailDomain.DomainName__c);				
			}
		}
		catch(Exception genEx){
            throw new BaseServiceException('Exception occured: UtilityHelper : getEmailDomainList method ', genEx);
        }
		return lstEmailDomain;	
	}
	
	/* 
		Gets the list of emails that we added to the account or contacts or any custom object as input
		if the domain is not existing in the custom setting, then we update the custom setting with new domains	
		we return the updated custom setting email domain list values back to the callee.
	*/
	public static list<String> processNewEmailDomainList(list<String> newEmailIdList){
		list<String> lstEmailDomain = null;
		try{
			lstEmailDomain = getEmailDomainList();
			Map<String, String> emailDomainMap = new Map<String, String>();
			//converting the existing domain names into a map
			for(String emailDomain : lstEmailDomain)
			{
				emailDomainMap.put(emailDomain,emailDomain);
			}
			list<String> domainName;
			list<String> newEmailDomainList = new list<String>();
			//checking whether the new email domain being passed from client is existing. If not updating the custom setting with new domain values
			for(String newEmailId : newEmailIdList){
				domainName = newEmailId.split('@');
				if(!emailDomainMap.containsKey(domainName[1])){
					
					emailDomainMap.put(domainName[1],domainName[1]);
					newEmailDomainList.add(domainName[1]);	
					lstEmailDomain.add(domainName[1]);									
				}			
			}
			if(!Utility.isEmpty(newEmailDomainList)){
				updateNewEmailDomainList(newEmailDomainList);				
			}
			
		}
		catch(Exception genEx){
            throw new BaseServiceException('Exception occured: UtilityHelper : processNewEmailDomainList method ', genEx);
        }
		
		return lstEmailDomain;
		
	}
	/* 
		Updates the custom setting with new domains	
		
	*/
	public static void updateNewEmailDomainList(list<String> newEmailDomainList){
		
		EmailDomainList__c emailDomainObj = null;
		list<EmailDomainList__c> lstEmailDomainToUpdate = null;
		try{
						
			lstEmailDomainToUpdate = new list<EmailDomainList__c>();
			for (String newEmailDomainEntry: newEmailDomainList) {
				emailDomainObj = new EmailDomainList__c();
				emailDomainObj.name = newEmailDomainEntry;
				emailDomainObj.DomainName__c = newEmailDomainEntry;
				lstEmailDomainToUpdate.add(emailDomainObj);			
			}
			DatabaseServiceUtil.upsertOperation(lstEmailDomainToUpdate);			
						
		}
		catch(Exception genEx){
            throw new BaseServiceException('Exception occured: UtilityHelper : getEmailDomainList method ', genEx);
        }
			
	}

}