@RestResource(urlMapping='/getClientData/v1/*')

global class SotreqRESTResource {
    @HttpGet
    global static SotreqClientDataResponse getClientData() {
        SotreqClientDataResponse.SotreqClientDataResponseStatus status = new SotreqClientDataResponse.SotreqClientDataResponseStatus();
        SotreqClientDataResponse.SotreqClientDataResponseContent content = new SotreqClientDataResponse.SotreqClientDataResponseContent();
        SotreqClientDataResponse.SotreqClientDataResponseMenu menu = new SotreqClientDataResponse.SotreqClientDataResponseMenu();
        SotreqClientDataResponse response = new SotreqClientDataResponse();
        response.status = status;
        response.content = content;
        
        try {
            RestRequest request = RestContext.request;
    
            // grab the phone number from the end of the URL
            String phoneNumber = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
            
            List<Contact> query = [
                SELECT
                    Id,
                    Name, 
                    FirstName, 
                    LastName,
                	AccountId
            //      UN
                FROM Contact
                WHERE
                	//Format 1
                	mobilePhone = :phoneNumber OR
                    
                    //Format 2
                    mobilePhone = :phoneNumber.replaceAll('\\D+','')
            ];
            
            
            if (query.isEmpty()) {
                content.clientExist = false;
            } else {
            	Contact contact = query[0];
                Account account = [
                SELECT
                    Name
            //		SetorAtividade__c,
            //      AreasVendas__c,
            //      UN
                FROM Account
                WHERE
                	Id = :contact.AccountId
            ];
                content.clientExist = true;
        		content.clientId = contact.Id;
                content.clientAccountName = account.Name;
            //  content.clientAreadeVendasId = contact.AreadeVendasId;
                content.clientFirstName = contact.FirstName;
        		content.clientLastName = contact.LastName;
                
                //procurar pelas UNs do contato vai depender de olhar dentro do salesforce da Sotreq e entender como essa informação está registrada.
        		//contect.UNs = contact.UNs;
            }
	    } catch(Exception e) {
            status.code = 500;
            status.message = e.getMessage();
        }
        if (status.code!=500) {
	        status.code = 200;
        }
        
        return response;
    }
}