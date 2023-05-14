/**
 * @author Maicon Santos
 * @createddate 14/05/2023
 * @description Test class for JavaScriptRemotingAndRemoteObjects controller
 */

@isTest
private class JSRemotingAndRemoteObjectsTest {
    @TestSetup
    static void makeData() {
        insert new List<Product2> {
            new Product2(
                Name = 'Pacote Indie',
                ProductCode = 'tst-indie-pkg',
                Description = 'test data'
            ),
            new Product2(
                Name = 'Pacote Indie Pro',
                ProductCode = 'tst-indie-pkg',
                Description = 'test data'
            ),
            new Product2(
                Name = 'Pacote AAA',
                ProductCode = 'tst-indie-pkg',
                Description = 'test data'
            )
        };
    }

    @isTest
    private static void getProductListTest() {
        Test.startTest();
        List<Product2> lstProduct2 = JSRemotingAndRemoteObjectsController.getProductList('Indie');
        Test.stopTest();

        System.assertEquals(2, lstProduct2.size());
    }
}