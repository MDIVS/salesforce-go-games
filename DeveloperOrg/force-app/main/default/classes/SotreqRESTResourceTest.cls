@IsTest
public class SotreqRESTResourceTest {
    static Id createTestRecord(){
        //Create test record
        Contact TestCtt = new Contact(FirstName='Test Contact', LastName='Testing', mobilePhone='789456123');
        insert TestCtt;
        return TestCtt.Id;
    } 
    @isTest static void test_getClientData() {
        Id recordId = createTestRecord();
        
        //setup a test request
        RestRequest request = new RestRequest();
        
        //set request properties
        request.requestURI = 'https://gogames-dev-ed.my.salesforce.com/services/apexrest/getClientData/v1/789456123';
        request.httpMethod = 'GET';
        
        // Finally, assign the request to RestContext if used
        RestContext.request = request;
        //End test setup
        
        //Call the method
        SotreqClientDataResponse response = SotreqRESTResource.getClientData();
        //Verify the result
        system.assertEquals(true, response.content.clientExist);
        system.assertEquals(response.content.clientId, recordId);
        system.assertEquals('Test Contact', response.content.clientFirstName);
        system.assertEquals('Testing', response.content.clientLastName);
    }
}