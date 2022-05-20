@isTest
public class Bugdatacleaning_Batch_Test
{
  public static string query;
    
     public static testmethod void bugdatacleaning_Batch_method()
     {
        list<Bug_Tracking__c> buglist = new list<Bug_Tracking__c>();
        Bug_Tracking__c  BT = new Bug_Tracking__c();
        BT.Class_Name__c = 'Bugdatacleaning_Batch';
        BT.Error__c = 'System.NullPointerException: Attempted to upsert a null list';
        BT.Severity__c = 'Major';
        buglist.add(BT);
        
        Bug_Tracking__c  BT1 = new Bug_Tracking__c();
        BT1.Class_Name__c = 'Bugdatacleaning_sche';
        BT1.Error__c = 'System.NullPointerException: Attempted to upsert a null list';
        BT1.Severity__c = 'Major';
        buglist.add(BT1);
        
        BugTracking_Configuration__c objBugClean = new BugTracking_Configuration__c();
        objBugClean.Name = 'BugDataCleaning_Config';
        objBugClean.Days_Before__c = 30;
        
        
        test.StartTest();
        insert buglist;
        insert objBugClean;
        test.Stoptest();
    
            query = 'SELECT Class_Name__c,CreatedDate FROM Bug_Tracking__c where CreatedDate < today ';
            Bugdatacleaning_Batch bugdata = new Bugdatacleaning_Batch(query);
            
            bugdata .start(null);
            try{
            bugdata .execute(null,buglist);
            }
            catch(DMLexception ex)
            {system.debug('exception ===>'+Ex);}
            bugdata .finish(null);     
         
         }
         
 }
 /*static testMethod void testBatchBugDataCleaning() {
        // TO DO: implement unit test
        String query = 'select name from Bug_Tracking__c';
        test.startTest();
        Bug_Tracking__c bugRecord = new Bug_Tracking__c();
        BugDataCleaning_Config__c objBugClean = new BugDataCleaning_Config__c();
        objBugClean.Name = 'BugDataCleaning_Config';
        objBugClean.Days_Before__c = 30;
            insert objBugClean;
        //bugRecord.Name = 'TestBug';
        system.debug(''+query);
        Batch_BugDataCleaning bugDataObj = new Batch_BugDataCleaning(query);
        database.executeBatch(bugDataObj, 10);
        BugDataCleaning_Scheduler sco = new BugDataCleaning_Scheduler();
        String sch = '0 0 23 * * ?';
        system.schedule('visit Creates', sch, sco);
        /*Database.BatchableContext BC; 
        list<sObject> lstScope = new  list<sObject>();
        Database.Querylocator locator = bugDataObj.start(BC);
        system.Assert(locator != null);
        bugDataObj.execute(BC,lstScope);        
        bugDataObj.finish(BC);*/
        //test.StopTest();*/