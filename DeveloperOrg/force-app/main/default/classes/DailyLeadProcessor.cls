// https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_scheduled

public with sharing class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> lstLead = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        for (Lead l : lstLead) l.LeadSource='Dreamforce';
        update lstLead;
    }
}