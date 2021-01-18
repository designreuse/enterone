package com.yedam.fandemic.login;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class Password {
	private static String iv;
	private static Key keySpec;
	private static String encodeKey = "QWERTYUIOPASDFGHJKLZXCVBNM123456789qwertyuiopasdfghjklzxcvbnm";

	public Password() throws UnsupportedEncodingException {
		this.iv = encodeKey.substring(0, 16);

		byte[] keyBytes = new byte[16];
		byte[] b = encodeKey.getBytes("UTF-8");
		int len = b.length;
		if (len > keyBytes.length) {
			len = keyBytes.length;
		}
		System.arraycopy(b, 0, keyBytes, 0, len);
		SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

		this.keySpec = keySpec;
	}
	
	
	// 암호화
	public static String encrypt(String str)
			throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException,
			InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
		c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));

		byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
		String enStr = new String(Base64.encodeBase64(encrypted));

		return enStr;
	}
	
	//복호화
	  public static String aesDecode(String str) throws java.io.UnsupportedEncodingException,
	      NoSuchAlgorithmException,
	      NoSuchPaddingException,
	      InvalidKeyException,
	      InvalidAlgorithmParameterException,
	      IllegalBlockSizeException,
	      BadPaddingException {
	    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	    c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
	 
	    byte[] byteStr = Base64.decodeBase64(str.getBytes());
	 
	    return new String(c.doFinal(byteStr),"UTF-8");
	  }

	// 임시비밀번호 비밀번호 길이 지정
	public static String getRamdomPw(int len) {

		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		System.out.println("charSet.length :::: " + charSet.length);
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거)
			System.out.println("idx :::: " + idx);
			sb.append(charSet[idx]);
		}

		return sb.toString();
	}

}
