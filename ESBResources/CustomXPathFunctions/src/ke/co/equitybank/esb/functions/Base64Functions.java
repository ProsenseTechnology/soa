package ke.co.equitybank.esb.functions;

import org.apache.commons.codec.binary.Base64;

public class Base64Functions {
    public static String encode(String xmlString) throws Exception {
        byte[] encodedBytes = Base64.encodeBase64(xmlString.getBytes());
        return new String(encodedBytes);
    }

    public static String decode(String xmlString) throws Exception {
        byte[] decodedBytes = Base64.decodeBase64(xmlString.getBytes());
        return new String(decodedBytes);
    }
}
