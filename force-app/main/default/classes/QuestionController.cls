public class QuestionController {

    public String Lname { get; set; }

    public String Fname { get; set; }
    
    //member declarations
    integer k=0;
    public List <Question__c> question{get;set;}
    public string QuestionsValue{get;set;}
    public List <AnswerObject__c> answerlist{get; set;}
    String selectedAnswer;
    String current_qid='';
	List<String> qidlist = new List<String>();   
    public List<Response> responselist= new LIST<Response>();
    public integer no_of_questions{get;set;}
    public integer no_of_attempted_questions  {get;set;}
    public  integer no_of_correct_answers{get;set;}
    integer index;
    //Controller for the page
    public QuestionController()
    {
        for(Question__c q :[SELECT QuestionId__c from Question__c where Active__c = true])
        {
            qidlist.add(q.QuestionId__c);
        }
       
        if(current_qid==''){
            current_qid=qidlist.get(0);
            index=0;
        }

        getData(current_qid);
        selectedAnswer = SelectedAnswerValue(current_qid);
        System.debug('selected answer'+ selectedAnswer);
        
    }
    //method to get the question and answer for the current qid
    public void getData(string current_qid)
    {
        For(Question__c q : [SELECT QuestionId__c,Questionsvalue__c,CorrectAnswer__c from Question__c where QuestionId__c=: current_qid ] )
        {
            QuestionsValue =q.QuestionsValue__c;
        }
        answerlist= [SELECT AnswerId__c,Answer__c from AnswerObject__c where QuestionId__c=: current_qid]; 
        selectedAnswer = SelectedAnswerValue(current_qid);
    }
    
    //method for getting the answers for a question
    public LIST<SelectOption> getAnswers()
    {
        LIST<SelectOption> options = new LIST<SelectOption>();
        for(AnswerObject__c a : answerlist)
        {
            options.add(new SelectOption(a.AnswerID__c,a.Answer__c));
        }
        return options;
        
    }
    
    public string getSelectedAnswer()
    {
        return SelectedAnswer;
    }
    
    public void setSelectedAnswer(string selectedAnswer)
    {
        this.selectedAnswer = selectedAnswer;
    }
    
    
    //action to move to the next question
    public PageReference NextQuestion()
    {
        SaveResponse();
		if(index<qidlist.size()-1 && index>= 0)
        {
            
            current_qid=qidlist.get(index+1);
            index =index+1;
        }
   	    getData(current_qid);
        return null;
        
    }
    
    //action to move to the previous question
    public PageReference PreviousQuestion()
    {
        SaveResponse();
       	if(index<qidlist.size() && index>= 0)
        {        
                if(index>0)
                {
                current_qid=qidlist.get(index-1);
                index =index-1;
            	}
            
        }
        getData(current_qid);
        return null;
    }
    
    
    //method to finally submit the responses and end the test
    Public PageReference Submit()
    {
        SaveResponse();
        return new PageReference('/apex/QuizResults');
    }
    
    // method to save response of a current question
 public void SaveResponse()
    {
        System.debug('list size ' + responselist.size());
        if(selectedAnswer!=null){
        for(integer i=0;i<responselist.size();i++){
            Response r = responselist.get(i);
                        if(r.qid== current_qid)
            {
                responselist.remove(i);
            }
        }
        responselist.add(new Response(current_qid,selectedAnswer));
        System.debug(responselist.size());
        System.debug('values');
        System.debug(responselist);
        }
        
    }
    
    public string SelectedAnswerValue(string qid)
    {
        string res;
                for(Response r: responselist)
        {
            if(r.qid== qid)
            {
                res= r.response;
            }
        }
        return res;
    }

    
    
    //method to get the values for correct answers, attempted question and total no of questions
    public void getResults()
    {
        no_of_correct_answers=0;
        no_of_questions=[Select count() from Question__c where Active__c = true];
        no_of_attempted_questions= responselist.size();
        for(integer f=0;f<responselist.size();f++){
            Response r = responselist.get(f);
            if(r.correct_response==r.response){
                no_of_correct_answers++;
            }
        }
        try{
           Contact c = new Contact();
            System.debug('Fname '+ Fname);
        c.FirstName = Fname;
        c.LastName=Lname;
        c.Scores__c= (no_of_correct_answers/no_of_questions);
        if(c.Scores__c< 60){
            c.Result__c='Fail';
        }
        else{
            c.Result__c='Pass';
        }
        System.debug(c);
        insert c; 
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    //class for response
    public class Response
    {
        string qid{get;set;}
        string response{get;set;}
        string correct_response;
        public Response(string qid,string response)
        {
            this.qid=qid;
            this.response= response;
            For(Question__c q : [SELECT QuestionId__c,CorrectAnswer__c from Question__c where QuestionId__c =: qid])
            {
                this.correct_response = q.CorrectAnswer__c;
            }
        }
    }
    
   public PageReference StartQuiz() {
       return new PageReference('/apex/QuestionsPage?QID=');
    }
    
    

}