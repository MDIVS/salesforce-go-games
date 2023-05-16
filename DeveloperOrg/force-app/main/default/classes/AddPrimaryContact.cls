// https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_queueable

public with sharing class AddPrimaryContact implements Queueable {
    private Contact ctt;
    private String state;
    public AddPrimaryContact(Contact ctt, String state) {
        this.ctt = ctt;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        List<Account> lstAccount = [SELECT Id FROM Account WHERE BillingState=:state LIMIT 200];
        List<Contact> lstCtt = new List<Contact>();

        for (Account acc : lstAccount) {
            Contact c = ctt.clone();
            c.AccountId = acc.Id;
            lstCtt.add(c);
        }

        insert lstCtt;
    }
}