public class OAuthImplementation{
    public String access_token{get;set;}
    public String rest_response{get;set;}
    public String code{get;set;}
    public String requesturl{get;set;}
    Map<String,Object> requestmap= new Map<String,Object>();
    public OAuthImplementation(){
        code=ApexPages.currentPage().getParameters().get('code');
    }
    
    public void gettoken(){
        String state=ApexPages.currentPage().getParameters().get('state');
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token?code='+code+
                        '&grant_type=authorization_code'+
                        '&client_id=3MVG9ZL0ppGP5UrCT9A4wN_1ZqE5_M5r5otTuhvY0TOQaDHuYcLXx6IhDz9SaQy_qDOAtQtef9Z9pmrQdbJPc'+
                        '&redirect_uri=https://shashank-19592-dev-ed.my.salesforce.com/apex/test');
        
        req.setMethod('POST');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        requestmap =(Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        access_token = (String)requestmap.get('access_token');
        
    }
    
    public void callRest(){
        Http http = new Http();
        String instance_url=(String)requestmap.get('instance_url');
        String endpoint =instance_url+requesturl;
        HttpRequest req2 = new HttpRequest();
        req2.setEndpoint(endpoint);
        req2.setHeader('Authorization', 'OAuth '+access_token);
        req2.setHeader('Content-Type', 'application/json');
        req2.setMethod('GET');
        HTTPResponse res2 = http.send(req2);
        //requestmap =(Map<String, Object>)JSON.deserializeUntyped(res2.getBody());
        rest_response = res2.getBody();
    }
    
    
}