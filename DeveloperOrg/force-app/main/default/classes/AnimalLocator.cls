/**
 * Maicon Santos
 * Desenvolvido para satisfazer o módulo do Trailhead https://trailhead.salesforce.com/content/learn/modules/apex_integration_services/apex_integration_rest_callouts
 */

global class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        ResponseBody result;
        if (response.getStatusCode() == 200) {
            result = (ResponseBody) JSON.deserialize(response.getBody(), ResponseBody.class);
        }

        return result.animal.name;
    }  

    private class ResponseBody {
        Animal animal;
    }

    private class Animal {
        Integer id;
        String name, eats, says;
    }
}