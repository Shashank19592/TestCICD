@istest(seeAlldata = true) 
public class DatabaseServiceUtil_Test{
public static String ObjectType;
public static String RecordTypeLabel;
public static List<SObject> UpsertList;
public static List<SObject> DeleteOpe;


     public static Testmethod void DatabaseServiceUpsertMethodTest(){
         try{
         
             Test.startTest();
             Account Acc = new Account();
             Acc.Name = 'Test1';
             Acc.Phone = '9949369398';
             Acc.Website = 'www.google.com';
             insert Acc;
             DatabaseServiceUtil.upsertOperation(Acc);  
             Account Acc1 = new Account();
             Acc1.Phone = '9949369398';
             Acc1.Website = 'www.google.com';           
             DatabaseServiceUtil.upsertOperation(Acc1);                       
             DatabaseServiceUtil.getRecordTypeId(ObjectType,RecordTypeLabel);   
             Test.StopTest();      
             
        }
        catch(Exception genEx){ 
            system.debug('ex ===>'+genEx);
        } 
    }
     public static Testmethod void DatabaseServiceUpsertMethodTestForException(){
         try{
             
             Test.startTest();
             UpsertList = new List<SObject>();
             UpsertList = createTestAccounts();
             DatabaseServiceUtil.upsertOperation(UpsertList);                       
              
             Test.StopTest();      
             
        }
        catch(Exception genEx){ 
            system.debug('ex ===>'+genEx);
        } 
    }
    public static TestMethod void DatabaseServicegetRecordTypeIdMethodTest(){
        try{
            ObjectType = 'Account';
            RecordTypeLabel = 'record';
            DatabaseServiceUtil.getRecordTypeId(ObjectType,RecordTypeLabel);  
        }
        catch(Exception genEx){
            system.debug('ex ===>'+genEx);
        }
    }
    public static Testmethod void DatabaseServiceDeleteMethodTest(){
        try{
            List<sObject> accounts = createTestAccounts();
            insert accounts;
            DatabaseServiceUtil.deleteOperation(accounts);
            DatabaseServiceUtil.deleteOperation(accounts[0]);
        }
        catch(Exception genEx){
             system.debug('ex ===>'+genEx);
        }
    }

    public static List<sObject>  createTestAccounts(){
        List<sObject> accounts = new List<sObject>();
             Account Acc = new Account();
             Acc.Name = 'Test1';
             Acc.Phone = '9949369398';
             Acc.Website = 'www.google.com';
             accounts.add(Acc);
             
             Account Acc1 = new Account();
             Acc1.Name = 'Test2';
             Acc1.Phone = '9949369398';
             Acc1.Website = 'www.google.com';
             accounts.add(Acc1);
             
             return accounts;
    }
    public static testmethod void getpicklistvals(){
        	
        try{
            
         List<string> pVals = new List<string>();
            pVals = DatabaseServiceUtil.getPickListValues('Account','Type');
          	Account Acc1 = new Account();
             //Acc1.Name = 'Test2';
             Acc1.Phone = '9949369398';
            DatabaseServiceUtil.upsertOperation(acc1); 
        }
        catch(exception e){}
    }
    
}