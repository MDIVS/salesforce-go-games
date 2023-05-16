/**
 * @author Maicon Santos
 * @createddate 2023/05/16
 * @description Contain generic utils
 */

public with sharing class GenericUtils {
    public static String formatPhone(String phoneNumber) {
        if (String.isBlank(phoneNumber)) return '';
        
        String telefoneFormatado = '';
        // (11)987623411
        if (phoneNumber.length() == 11) {
            return '(' + phoneNumber.substring(0, 2) + ') ' + phoneNumber.substring(2, 6) + '-' + phoneNumber.substring(6);
        } else if (phoneNumber.length() == 13) {
            // +5511987623411
            return '+' + phoneNumber.substring(0, 2) + phoneNumber.substring(2, 6) + '-' + phoneNumber.substring(6);
        }

        return '';
    }
}