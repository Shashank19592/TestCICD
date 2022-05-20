@isTest
Public class Utility_Test
{
 public static Object obj1;
 public static string str;
 public static List<Object> listOfObj;
 public static Map<String,Object> mapOfObj;
 Public Static testmethod void utility_method()
 {
    listofobj = new list<object>();
    mapofobj  = new map<string,object>();
   // Utility U = new Utility();
   Test.startTest();
    Utility.isEmpty(obj1);
    Utility.isEmpty(str);
    Utility.isEmpty(listOfObj);
    Utility.isEmpty(mapOfObj);
     obj1 = new Account();
     str = 'test';
     listOfObj.add(obj1);
     mapOfObj.put('key', obj1);
     Utility.isEmpty(obj1);
    Utility.isEmpty(str);
    Utility.isEmpty(listOfObj);
    Utility.isEmpty(mapOfObj);
     Test.stopTest();
  }
}