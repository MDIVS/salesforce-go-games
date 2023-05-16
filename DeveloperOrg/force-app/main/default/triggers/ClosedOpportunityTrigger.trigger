// https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_bulk

trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> lstTask = new List<Task>();
    for (Opportunity o : Trigger.new) {
        lstTask.add(new Task(
            Subject='Follow Up Test Task',
            WhatId=o.Id
        ));
    }
    insert lstTask;
}