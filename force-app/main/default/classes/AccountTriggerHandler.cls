global class AccountTriggerHandler{

public void AccountDebug(){
    Map<Id,Account> alist=new Map<Id,Account>();
    alist=(Map<Id,Account>)Trigger.NewMap;
    System.debug('adasda :' + alist.size());
    
}

@InvocableMethod(label='Convert Leads')
public static void ConvertLead(List<Id> Eventid){
}
}