package ke.co.equitybank.esb.functions;

import java.io.FileInputStream;

import java.security.Key;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.Security;
import java.security.Signature;

import org.apache.commons.codec.binary.Base64;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class EncryptionFunctions {
    static String domainDir = System.getenv("DOMAIN_HOME");
    static String keysDir = "keys";
    static String pathSeparator = "//";

    public static String encrypt(String data, String keystore, String keystorePwd, String keyAlias, String keyAliasPwd) throws Exception {
        byte[] dataToEncrypt = data.getBytes("UTF-8");
        byte[] encryptedData = null;
        Security.addProvider(new BouncyCastleProvider());
        KeyStore ks = KeyStore.getInstance("JKS");
        ks.load(new FileInputStream(domainDir + pathSeparator + keysDir  + pathSeparator + keystore), keystorePwd.toCharArray());
        Key key = ks.getKey(keyAlias, keyAliasPwd.toCharArray());
        PrivateKey privKey = (PrivateKey) key;
        Signature signature = Signature.getInstance("SHA256withRSA", "BC");
        signature.initSign(privKey);
        signature.update(dataToEncrypt);
        encryptedData = signature.sign();
        return new String(Base64.encodeBase64(encryptedData));
    }
}
