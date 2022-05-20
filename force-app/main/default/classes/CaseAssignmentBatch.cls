global class CaseAssignmentBatch implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id from Case');
    }
    global void execute(Database.BatchableContext BC, list<Case> scope){
        //Fetching the assignment rules on case
        AssignmentRule AR = new AssignmentRule();
        AR = [select id from AssignmentRule where SobjectType = 'Case' and Active = true limit 1];
        
        //Creating the DMLOptions for "Assign using active assignment rules" checkbox
        Database.DMLOptions dmlOpts = new Database.DMLOptions();
        dmlOpts.assignmentRuleHeader.assignmentRuleId= AR.id;
        
        For(Case newCase : scope){
            newCase.setOptions(dmlOpts);
        }
        //Setting the DMLOption on Case instance
        
        update scope ;
        
    }
    
    global void finish(Database.BatchableContext BC){}
    
    
    
}