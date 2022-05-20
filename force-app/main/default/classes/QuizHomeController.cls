public class QuizHomeController {
 public    QuizHomeController()
    {
        
    }
public PageReference StartQuiz() {
        PageReference a = new PageReference('/apex/QuestionsPage?QID=');
        a.setRedirect(true);
        return a;
    }

    
    
}