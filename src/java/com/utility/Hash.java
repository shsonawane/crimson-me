/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utility;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author Shubham
 */
public class Hash {
    
    public Hash(){}
    
   public String getHash(String input) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        byte[] bytesOfMessage = Base64.decodeBase64(input);
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] thedigest = md.digest(bytesOfMessage);
        return Base64.encodeBase64String(thedigest);
    }
    
}
