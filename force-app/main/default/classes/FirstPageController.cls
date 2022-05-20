public class FirstPageController {
    
public void OnLoad()
   {
       String user_name = UserInfo.getName();
      String strurl = ApexPages.currentPage().getUrl();
 strurl = strurl.split('apex/')[1];
       try{
          PageLog__c p = new PageLog__c();
           p.PageName__c= strurl;
           p.Page_Accessed_time__c= date.today().format();
           p.Username__c = user_name;
           insert p;
           System.debug('value inserted');
       }
       catch(Exception e)
       {
           System.debug('DML Exception' + e.getCause());
       }
      System.debug(' username is' + user_name+ 'page name is '+ strurl  );
       
       
   }
}