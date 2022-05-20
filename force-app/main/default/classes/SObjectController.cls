public with sharing class SObjectController {
   
    @AuraEnabled 
    public static List<SObject> getRecords(String objectname){
        string query = 'select id,name from '+objectname;
		List <SObject> records =Database.query(query);
        return records;
    }
    // Params: recordId - Opportunity record id.
    @AuraEnabled
    public static Integer getOpportunityCurrentRating( Id recordId ,String objectname ){
        try{
            //string query = 'SELECT Id, Rating__c from '+ objectname +' WHERE Id=' ' + recordId + ''';
            string query = 'select id, Rating__c from '+objectname+' where id=\'' + recordId + '\'';
            System.debug(query);
        	//Opportunity oppRecord = [SELECT Id, Rating__c from Opportunity WHERE Id=:recordId];
        	SObject oppRecord = Database.query(query);
        	Integer rating = Integer.valueOf(oppRecord.get('Rating__c'));
        	//return oppRecord.Rating__c != null ? Integer.valueOf( oppRecord.Rating__c )  : 0;
            if(rating==null){
                return 0;
            }else{
                return rating;
            }
        	 
            
        }catch(Exception e){
            System.debug(e);
            return 0;
        }
        
    }
    
    // Used to update Opportunity record with new rating.
    // Params: { recordId: Opportunity record id, rating: new rating for this opportunity }
    @AuraEnabled
    public static String updateOpportunityRating(Id recordId, Decimal rating, String objectname ){
        System.debug('method entered' + recordId + rating + objectname);
        try{
            String objName = objectname ;
			sobject sObj = Schema.getGlobalDescribe().get(objName).newSObject(recordId) ;
			sObj.put('Rating__c' , rating) ;
            System.debug(sObj);
			update sObj ;
			return 'SUCCESS';
        }catch(Exception e){
            System.debug(e);
            return 'Error';
        }
        
    }
    

}