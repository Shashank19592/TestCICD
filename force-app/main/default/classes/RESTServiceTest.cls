@RestResource(urlMapping='/registeruser/*')
global with sharing class RESTServiceTest {
	@HttpGet
    global static string doGet() {
       
        String result = [Select id,Name from account limit 1].ID;
        return result;
    }
    @HttpPost
    global static WrapperObject geta(String firstName, String lastName, String email,String policyNum,String PL, String language) {
		//firstName, lastName, email, policyNum,PL,language
		Savepoint sp = Database.setSavepoint();
		WrapperObject obj = new WrapperObject();
        obj.successindicator =true;
        obj.message='Succefully registerd';
        
       return obj;
    }
    
    global class WrapperObject{
        Boolean successindicator;
        String message;
    }
}