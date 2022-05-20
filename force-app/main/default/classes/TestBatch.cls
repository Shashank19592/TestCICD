global class TestBatch implements Database.Batchable<sObject> {
    
    
    global final String Query;
    public List<Database.BatchableContext> bclist=new List<Database.BatchableContext>() ;
    global TestBatch(String q){        
        Query=q; 
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        SYstem.debug(scope);
        Id jobid = BC.getJobID();
        Id childid = BC.getChildJobID();
    }
    
    global void finish(Database.BatchableContext BC){
        System.debug('BC Id: '+ BC);
        System.debug('bclist Id: '+ bclist);
    }
    
    
}