global with sharing class FutureClass {
    @future
    public static void myFutureMethod(Set<Id> objList){
        System.debug(objList);
    }

}