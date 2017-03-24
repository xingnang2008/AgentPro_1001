package com.cargo.util;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

/*
 * 
 * 用于密度重置。
 */

public class CreateMD5pin {
	public static void main(String args[]){
		String user="admin";
		String pswd="admin";
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		String password =md5.encodePassword(pswd,user);
		System.out.println(password);
	}

}
