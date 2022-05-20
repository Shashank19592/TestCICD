public with sharing class ContactCarouselController {
    
    @AuraEnabled
    public static List<Contact> findAll(){
        //LIST<Contact> contactlist = new LIST<Contact>();
        //contactlist =
        return [Select id, Name, MobilePhone, sha2nk__Picture_URL__c from contact where sha2nk__Picture_URL__c != NULL];
        
    }

}