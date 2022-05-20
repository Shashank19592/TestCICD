public class CreateAccount{

public string accountName{get;set;}
public string accountNumber{get;set;}
public string accountSite{get;set;}
public string accPhoneNumber{get;set;}
public integer Annualrevenue{get;set;}

 public void save() {
 Account actObj = new Account();
 try{
 actObj.Name = accountName;
 actObj.AccountNumber = accountNumber;
 actObj.Site=accountSite;
 actObj.Phone =accPhoneNumber;
 actObj.AnnualRevenue = Annualrevenue;
 }
  catch(Exception e){

 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,' '));
}
if((actObj.Name!=null) && (actObj.AccountNumber!=null))
{
 insert actObj;
 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Account created Successful!'));
 }
}
}