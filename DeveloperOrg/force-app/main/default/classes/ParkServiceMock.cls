@isTest
global class ParkServiceMock implements WebServiceMock  {
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ) {
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        response_x.return_x = new String[]{'Strong Park', 'Lake Park', 'Central Park'};
        // response_x.return_x.add('Strong Park');
        // response_x.return_x.add('Lake Park');
        // response_x.return_x.add('Central Park');
        response.put('response_x', response_x); 
    }
}