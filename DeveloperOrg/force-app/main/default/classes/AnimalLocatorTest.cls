@isTest 
private class AnimalLocatorTest {
    static testMethod void testPostCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());  
        String strResp = AnimalLocator.getAnimalNameById(2);
    }
}