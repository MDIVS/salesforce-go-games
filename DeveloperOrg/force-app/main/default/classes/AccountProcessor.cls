// https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_future_methods
public class AccountProcessor {
    @future
    public static void countContacts(List<Id> lstAccId) {
        List<Account> lstAcc = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :lstAccId];
        for (Account acc : lstAcc) {
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        update lstAcc;
    }
}