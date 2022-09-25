@RestResource(urlMapping='/Accounts/*/contacts')
Global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        //Grab the accountId from end of URL
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account acc = [select Id,Name,(select Id,Name from Contacts) from Account where Id = :accountId];
        system.debug('Account and Related Contacts->>>>'+acc);
        return acc;
    }
}