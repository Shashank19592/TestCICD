/* Created batchable class to clean the Bug data before 45 days back */
global class Bugdatacleaning_Batch implements Database.Batchable<sObject>
{

   public string query{get;set;}
          
     public Bugdatacleaning_Batch (String strquery){
            this.query = strquery;
      }
   
   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
      }

   global void execute(Database.BatchableContext BC, List<sObject> buglist){
                 try{
                  if(buglist.isEmpty()) return; 
                          
                  //DatabaseServiceUtil.deleteOperation(buglist);
                 
                 
            }catch(DMLException ex){ 
            throw new BaseServiceException('Exception occured: Bugdatacleaning_Batch : execute method ',ex);
      }

            }
   global void finish(Database.BatchableContext BC){
   }
}