/**
 * @author Maicon Santos
 * @createddate 14/05/2023
 * @description Controller for JavaScriptRemotingAndRemoteObjects visualforce
 */

global with sharing class JSRemotingAndRemoteObjectsController {
    @RemoteAction
    global static List<Product2> getProductList(String searchString) {
        searchString = String.escapeSingleQuotes(searchString);

        return String.isBlank(searchString) ? [
            SELECT Id, Name, ProductCode, Description FROM Product2
        ] : [
            SELECT Id, Name, ProductCode, Description FROM Product2
            WHERE Name LIKE :('%'+searchString+'%')
        ];
    }
}