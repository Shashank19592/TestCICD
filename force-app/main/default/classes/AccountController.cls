public with sharing class AccountController {
	@Auraenabled
    public static List<Account> findAll(){
        return [SELECT id, name, phone FROM Account LIMIT 50];
    }
    
    @AuraEnabled
    public static Account saveAccount(Account acc) {
        upsert acc;
        return acc;
    }
    
    @AuraEnabled
    public static Account delAccount(Account acc) {
        delete acc;
        return acc;
    }
    
}