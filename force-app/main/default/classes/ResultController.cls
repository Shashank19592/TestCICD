public class ResultController {
   public integer no_of_questions{get;set;}
        public integer no_of_attempted_questions  {get;set;}
   public  integer no_of_correct_answers{get;set;}
   public Decimal result{get;set;}
    public void OnLoad(){
         no_of_questions =[Select count() From Question__c];
         no_of_attempted_questions=[Select count() From ResponseObject__c];
         no_of_correct_answers=0;
        for(ResponseObject__c r: [SELECT QuestionId__c,SelectedResponse__c,CorrectResponse__c from ResponseObject__c])
        {
            if(r.SelectedResponse__c==r.CorrectResponse__c)
            {
                no_of_correct_answers++;
            }
        }
         result = no_of_correct_answers / no_of_questions  ;
        List<ResponseObject__c> resp = [SELECT QuestionId__c,SelectedResponse__c,CorrectResponse__c from ResponseObject__c];
        delete resp;
    }
}