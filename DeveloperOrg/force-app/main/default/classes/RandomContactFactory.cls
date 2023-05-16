// https://trailhead.salesforce.com/pt-BR/content/learn/modules/apex_testing/apex_testing_data

public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer n, String lastNames) {
        List<Contact> lstContact = new List<Contact>();
        for (Integer i=0; i<n; i+=1) lstContact.add(new Contact(FirstName='Test '+String.valueOf(i), LastName=lastNames));
        return lstContact;
    }
}