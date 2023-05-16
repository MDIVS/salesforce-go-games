// https://trailhead.salesforce.com/pt-BR/content/learn/modules/apex_testing/apex_testing_triggers

@isTest
private class TestRestrictContactByName {
    @isTest
    private static void TestRestrictContactByName() {
        Test.startTest();
        List<Contact> ctts = new List<Contact> {
            new Contact(LastName='INVALIDNAME'),
            new Contact(LastName='INVALIDNAME')
        };
        Database.SaveResult[] results = Database.insert(ctts, false);
        Test.stopTest();

        // Iterate through each returned result
        for (Database.SaveResult sr : results) {
            System.assert(!sr.isSuccess());

            for (Database.Error err : sr.getErrors()) {
                System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', err.getMessage());
            }
        }
    }
}