package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Company {

	String com_no;          // 
	String com_id;			//소속사ID
	String com_pw;			//패스워드
	String com_name;		//소속사명
	String com_phone;		//연락처
	String com_address;		//주소
	String com_address2;	//주소상세
	String com_email;		//이메일
	String com_pic;			//사진
	String com_class;		//권한분류
	String com_time;		//가입일
	String com_introduce;   //소개글
	String com_zipAddress;  //우편번호
	
	private int com_first; // 페이지네이션
	private int com_last;
	
	
	// 유효성 검사
	String com_pwCheck;
}