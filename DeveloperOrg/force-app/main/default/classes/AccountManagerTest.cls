@isTest
private class AccountManagerTest {
    //Helper method to create dummy record
    static Id createTestRecord(){
        //Create test record
        Account TestAcc = new Account(Name='Test Account', Phone='8786757657', CNPJ__c='56713970000189');
        insert TestAcc;
        return TestAcc.Id;
    } 
    
    //Method to test getAccount()
    @isTest static void getAccountTest(){
        Id recordId = createTestRecord();
        //setup a test request
        RestRequest request = new RestRequest();
        //set request properties
        request.requestURI = 'https://gogames-dev-ed.my.salesforce.com/services/apexrest/Accounts/' + recordId +'/contacts';
        request.httpMethod = 'GET';
        // Finally, assign the request to RestContext if used
        RestContext.request = request;
        //End test setup
        
        //Call the method
        Account thisAcc = AccountManager.getAccount();
        //Verify the result
        system.assert(thisAcc != null);
        system.assertEquals('Test Account', thisAcc.Name);
    }
}