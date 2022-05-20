global class TestSoap {
    
    
    webservice static Account createAccountPlan(String AccName) {
        //test
        return [Select Id, Name from Account where Name Like: '%'+AccName+'%' LIMIT 1];
        
    }
    
    
}