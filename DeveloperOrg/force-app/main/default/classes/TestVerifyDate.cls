// https://trailhead.salesforce.com/pt-BR/content/learn/modules/apex_testing/apex_testing_intro

@isTest
private class TestVerifyDate {
    @isTest
    private static void TestVerifyOutOfDate() {
        Test.startTest();
        Date result = VerifyDate.CheckDates(Date.newInstance(1960, 2, 17), Date.newInstance(1960, 5, 17));
        Test.stopTest();

        System.assertEquals(Date.newInstance(1960, 2, 29), result);
    }

    @isTest
    private static void TestVerifyInDate() {
        Test.startTest();
        Date result = VerifyDate.CheckDates(Date.newInstance(1960, 2, 17), Date.newInstance(1960, 2, 20));
        Test.stopTest();

        System.assertEquals(Date.newInstance(1960, 2, 20), result);
    }
}