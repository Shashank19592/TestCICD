public with sharing class BugDataCleaning_Sche implements Schedulable
{
     public void execute(SchedulableContext SC) 
     { 
        try{
        // Here custom setting information
        BugTracking_Configuration__c bugTraCon = getbugDataCleaning();
        
        // calling Batch class to delete Bug Tracking data
        Bugdatacleaning_Batch bugBatch = new Bugdatacleaning_Batch (query1(bugTraCon));
        database.executeBatch(bugBatch);
         }
        catch(Exception bsExc){ 
        throw new BaseServiceException('Exception occured: BugDataCleaning_Sche : execute method ',bsExc);
                }
         }
    
        public BugTracking_Configuration__c getbugdatacleaning(){
       
                if(BugTracking_Configuration__c.getInstance('BugTrackingConfig') == null){
                      BugTracking_Configuration__c BugTracking = new BugTracking_Configuration__c ();
                      try{
                            BugTracking.Days_Before__c = 45 ;
                            insert BugTracking;
                         }
                      catch(DMLException dmlEx){ 
                      throw new BaseServiceException('Exception occured: BugDataCleaning_Sche : getBugDataCleaning method ',dmlEx);
                }
                
                      return bugTracking;
                }else 
                      return bugTracking_Configuration__c.getInstance('BugTrackingConfig');
          }
          //here retriving data from Bug_Tracking__c with condition
         public String query1(BugTracking_Configuration__c bugTraCon ){
                Integer DaysBefore = Integer.ValueOf(BugTraCon .Days_Before__c);
                return 'SELECT Class_Name__c,CreatedDate FROM Bug_Tracking__c where createddate < LAST_N_DAYS:'+DaysBefore;
          }
}