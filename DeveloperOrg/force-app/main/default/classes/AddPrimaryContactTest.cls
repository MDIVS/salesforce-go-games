// https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_queueable

@isTest
private class AddPrimaryContactTest {
    @isTest
    private static void AddPrimaryContactTest() {
        List<Account> lstAcc = new List<Account>();
        for (Integer i=50; i>0; i--) lstAcc.add(new Account(Name='Test '+String.valueOf(i), BillingState='CA'));
        insert lstAcc;

        Test.startTest();
        System.enqueueJob(new AddPrimaryContact(new Contact(LastName='Contact Test'), 'CA'));
        Test.stopTest();

        System.assertEquals(50, [SELECT COUNT() FROM Contact WHERE LastName='Contact Test']);
    }
}