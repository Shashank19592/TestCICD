public class EmployeeClass {
    public Employee__c createEmployee()
    {
        Employee__c emp = new Employee__c();
        emp.Employee_Name__c ='Apex';
        emp.Phone_Number__c= '1234567890'
            ;
        insert emp;
        System.debug('employee inserted');
        return emp;
        
    }
}