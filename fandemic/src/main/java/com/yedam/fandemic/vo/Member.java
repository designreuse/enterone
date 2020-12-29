package com.yedam.fandemic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
	
	String mem_no;			// rownum
	String mem_id;			//개인회원ID
	String mem_name;		//회원이름
	String mem_pw;			//회원PW
	String mem_birth;		//생년월일mem_birth
	String mem_phone;		//연락처
	String mem_email;		//이메일
	String mem_address;		//주소
	String mem_address2;	//주소상세
	String mem_type;		//소셜로그인분류(보류)
	String mem_class;		//회원등급
	String mem_point;		//활동포인트
	String mem_time;		//가입일
	String mem_gender;		//성별
	String mem_pic;			//프사
	
	String mem_zipAddress;  //우편번호
	
	private int mem_first; // 페이지네이션
	private int mem_last;
	
}
