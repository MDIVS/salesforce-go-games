global class SotreqClientDataResponse {
    global SotreqClientDataResponseStatus status {get;set;}
    global SotreqClientDataResponseContent content {get;set;}
    
	global class SotreqClientDataResponseContent {
        global boolean clientExist {get;set;}
        global Id clientId {get;set;}
        global string clientFirstName {get;set;}
        global string clientLastName {get;set;}
        global string clientAccountName {get;set;}
        global List<string> clientUNs {get;set;}
        
        global SotreqClientDataResponseMenu menu {get;set;}
    }
    
    global class SotreqClientDataResponseStatus {
        global Integer code {get;set;}
        global String message {get;set;}
    }
    
    global class SotreqClientDataResponseMenu {
        global List<string> UNMI {get;set;}
        global List<string> UNPE {get;set;}
        global List<string> UN_de_exemplo {get;set;}
    }
}