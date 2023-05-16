// https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_scheduled

@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2042';

    @isTest
    private static void DailyLeadProcessorTest() {
        List<Lead> lstLead = new List<Lead>();
        for (Integer i=200; i>0; i--) {
            lstLead.add(new Lead(LastName='Test '+String.valueOf(i), Company='Test company', CNPJ__c='94.359.692/0001-02'));
        }
        insert lstLead;
        List<Id> lstLeadId = new List<Id>();
        for (Lead l : lstLead) lstLeadId.add(l.Id);

        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());

        // Verify the scheduled job has not run yet.
        Integer result = [SELECT COUNT() FROM Lead WHERE Id IN :lstLeadId AND LeadSource='Dreamforce'];
        System.assertEquals(0, result, 'Leads were updated before job run');

        // Stopping the test will run the job synchronously
        Test.stopTest();

        // Now that the scheduled job has executed,
        result = [SELECT COUNT() FROM Lead WHERE Id IN :lstLeadId AND LeadSource='Dreamforce'];
        System.assertEquals(200, result, 'Leads were not updates');
    }
}