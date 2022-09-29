@isTest 
private class AnimalLocatorTest {
    @isTest
    static void testPostCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());  
        String animalName = AnimalLocator.getAnimalNameById(2);
        System.assertEquals('Test', animalName);
    }
}