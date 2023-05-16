// https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_intro

trigger AccountAddressTrigger on Account (before insert, before update) {
    for (account a : Trigger.new) {
        if (a.Match_Billing_Address__c==true && a.BillingPostalCode!=null) a.ShippingPostalCode=a.BillingPostalCode;
    }
}