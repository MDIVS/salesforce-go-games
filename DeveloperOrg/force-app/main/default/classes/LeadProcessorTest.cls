// https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex/async_apex_batch

@isTest
private class LeadProcessorTest {
    @isTest
    private static void LeadProcessorTest() {
        List<Lead> lstLead = new List<Lead>();
        for (Integer i=200; i>0; i--) {
            lstLead.add(new Lead(LastName='Test '+String.valueOf(i), Company='Test company', CNPJ__c='94.359.692/0001-02'));
        }
        insert lstLead;

        Test.startTest();
        LeadProcessor myBatchObject = new LeadProcessor();
        Id batchId = Database.executeBatch(myBatchObject);
        Test.stopTest();

        List<Id> lstLeadId = new List<Id>();
        for (Lead l : lstLead) lstLeadId.add(l.Id);
        
        lstLead = [SELECT LeadSource FROM Lead WHERE Id IN :lstLeadId];
        for (Lead l : lstLead) System.assertEquals('Dreamforce', l.LeadSource);
    }
}