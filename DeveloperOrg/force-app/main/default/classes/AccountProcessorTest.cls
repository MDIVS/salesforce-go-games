// https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_future_methods
@isTest
private class AccountProcessorTest {
    @isTest
    private static void AccountProcessorTest() {
        Account acc = new Account(Name='Test acc');
        insert acc;
        Contact cct = new Contact(LastName='Test ctt', AccountId=acc.Id);
        insert cct;

        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{acc.Id});
        Test.stopTest();

        System.assertEquals(1, [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :acc.Id].Number_Of_Contacts__c);
    }
}