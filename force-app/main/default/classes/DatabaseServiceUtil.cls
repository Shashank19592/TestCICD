public with sharing class DatabaseServiceUtil {
    
    /* Performs DB Upsert operation of List<SObject> passed  */
    public static List<String> upsertOperation(List<SObject> upsertObjList){
         List<String> idList = new List<String>();
         try{
        list<Database.UpsertResult> saveResultList = Database.upsert(upsertObjList,true);        
       
        for(Database.UpsertResult saveResult:saveResultList) {
            if(!saveResult.isSuccess()){
                Database.Error err = saveResult.getErrors()[0];
                break;
            }
            idList.add(saveResult.getId()); 
        }
        }
        catch(DMLException dmlEx){ 
            throw new BaseServiceException(
            'Exception occured: DatabaseServiceUtil : upsertOperation method ', dmlEx);            
        }
        catch(Exception genEx){ 
           throw new BaseServiceException(
            'Exception occured: DatabaseServiceUtil : upsertOperation method ', genEx);  
            
        }  

        return idList;
    }
    
    
    /* Performs DB upsert operation with Sobject passed */
    public static List<String> upsertOperation(SObject upsertObj){
        
        List<String> idList = new List<String>();   
        try{
            Database.Upsertresult upsertResult= Database.upsert(upsertObj, true);
            
            if(!upsertResult.isSuccess()){
                Database.Error err = upsertResult.getErrors()[0];
                
            }else{
                idList.add(upsertResult.getId());            
            }
        }
        catch(DMLException dmlEx){ 
            throw new BaseServiceException(
            'Exception occured: DatabaseServiceUtil : upsertOperation method ', dmlEx);            
        }
        catch(Exception genEx){ 
           throw new BaseServiceException(
            'Exception occured: DatabaseServiceUtil : upsertOperation method ', genEx);  
            
        }  
     
        return idList;
    } 
    /* Performs DB delete operation on List<SObject> passed */
    public static List<String> deleteOperation(List<SObject> deleteObjList){
         List<String> idList = new List<String>();
       try{
        Database.DeleteResult[] deleteResultList = Database.delete(deleteObjList, true);
       
        String dbErrMessage = '';
        for(Database.DeleteResult deleteResult:deleteResultList) {
            if(!deleteResult.isSuccess()){
                Database.Error err = deleteResult.getErrors()[0];
                dbErrMessage = dbErrMessage + err.getMessage();
                
            }
            idList.add(deleteResult.getId());
        }
        }
        catch(DMLException dmlEx){ 
            throw new BaseServiceException(
            'Exception occured: DatabaseServiceUtil : deleteOperation method ', dmlEx);            
        }
        catch(Exception genEx){ 
           throw new BaseServiceException(
            'Exception occured: DatabaseServiceUtil : deleteOperation method ', genEx);  
            
        }  

        return idList;
    }
    /* Performs DB delete operation with Sobject passed */
    public static List<String> deleteOperation(SObject deleteObj){
        List<String> idList = new List<String>();
        try{
        Database.Deleteresult deleteResult= Database.delete(deleteObj, true);
        
        if(!deleteResult.isSuccess()){
            Database.Error err = deleteResult.getErrors()[0];
            
        }else{
            idList.add(deleteResult.getId());            
        }
        } 
        catch(DMLException dmlEx){ 
            throw new BaseServiceException(
            'Exception occured: DatabaseServiceUtil : deleteOperation method ', dmlEx);            
        }
        catch(Exception genEx){ 
           throw new BaseServiceException(
            'Exception occured: DatabaseServiceUtil : deleteOperation method ', genEx);  
            
        }  
       
        return idList;
    }  
    
    
    /**********************************************************************************
    // Method returns Recordtype id for the OBJECT NAME and the RECORDTYPE NAME passed
    **********************************************************************************/
    public static ID getRecordTypeId(String ObjectType, String RecordTypeLabel)
    {
        Id rtId = null;
        try{
            Map<String, Schema.SObjectType> sObjectMap = Schema.getGlobalDescribe() ;
            Schema.SObjectType s = sObjectMap.get(ObjectType) ; // getting Sobject Type
            Schema.DescribeSObjectResult resSchema = s.getDescribe() ;
            Map<String,Schema.RecordTypeInfo> recordTypeInfo = resSchema.getRecordTypeInfosByName(); //getting all Recordtype for the Sobject
            rtId = recordTypeInfo.get(RecordTypeLabel).getRecordTypeId();//particular RecordId by  Name
        }catch(Exception ex){ 
            throw new BaseServiceException('Exception occured: Utility : getRecordTypeId method ',ex);
        }
        
        return rtId;
    } 
    
    
    /**********************************************************************************
    // Method returns the Picklist values of the FIELDNAME of the OBJECTNAME passed
    **********************************************************************************/
    public static list<String> getPickListValues(String ObjectType, String PickListFieldAPIName)
    {
        list<String> pickListValues = new list<String>();
        try{
        	SObjectType sObjType = Schema.getGlobalDescribe().get(ObjectType);
			Map<String,Schema.SObjectField> mfields = sObjType.getDescribe().fields.getMap();
			
			Schema.DescribeFieldResult field = mfields.get(PickListFieldAPIName).getDescribe();
			system.debug('picklist values'+field.getPicklistValues());
        	for (Schema.PicklistEntry f : field.getPicklistValues())
          		pickListValues.add(f.getLabel());
            
        }catch(Exception ex){ 
            throw new BaseServiceException('Exception occured: Utility : getPickListValues method ',ex);
        }
        
        return pickListValues;
    }

}