package com.yedam.fandemic.login;

import lombok.Data;

@Data
public class Mail {
	
	private String senderName;    //발신자 이름
    private String senderMail;    //발신자 이메일 주소
    private String receiveMail;    //수신자 이메일 주소
    private String subject;            //제목
    private String message;            //본문



}
