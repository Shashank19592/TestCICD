@isTest		//(seealldata = true)
public class BugDataCleaning_Sche_Test{
    public static string query1;
   
    public static testmethod void BugDataCleaning_Sche_Method()
    {
     List<Bug_Tracking__c> BugList = new List<Bug_Tracking__c>();
     Bug_Tracking__c  BugTrack = new Bug_Tracking__c();
     BugTrack .Class_Name__c = 'Bugdatacleaning_Batch';
     BugTrack .Error__c = 'System.NullPointerException: Attempted to upsert a null list';
     BugTrack .Severity__c = 'Major';
     BugList.add(BugTrack ); 
      
     query1 = 'SELECT Class_Name__c,CreatedDate FROM Bug_Tracking__c where CreatedDate < today'; 
     BugDataCleaning_Sche BatchCleanSche = new BugDataCleaning_Sche();
     
             
     try{
     test.StartTest();
     insert BugList;
     test.Stoptest();
      
     BatchCleanSche.execute(null);
     Bugdatacleaning_Batch BugBatch = new Bugdatacleaning_Batch (query1); 
     //BatchCleanSche.getbugdatacleaning();        
                          
      }
      catch(Exception bsExc){ 
      system.debug('@@@->'+bsExc);
      }
           
     }
     
     public static testmethod void testgetbugdatacleaning()
     {
      BugTracking_Configuration__c objBugClean = new BugTracking_Configuration__c();
     try{
     
        objBugClean.Name = 'BugDataCleaning_Config';
        objBugClean.Days_Before__c = 45;
            insert objBugClean;
         Test.startTest();
         new BugDataCleaning_Sche().query1(objBugClean);
         Test.stopTest();
      }
     catch(DMLException dmlEx){ 
     system.debug('@@@->'+dmlex);
     }
    }
}