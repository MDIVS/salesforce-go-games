// https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_batch

public with sharing class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id FROM Lead'
        );
    }

    public void execute(Database.BatchableContext bc, List<Lead> scope){
        for (Lead l : scope) l.LeadSource = 'Dreamforce';
        update scope;
    }

    public void finish(Database.BatchableContext bc) {}
}