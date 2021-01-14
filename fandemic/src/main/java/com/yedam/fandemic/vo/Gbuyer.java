package com.yedam.fandemic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Gbuyer {

	// gbuyer
	String gb_no;		//주문번호
	String mem_id;		//member.회원ID
	String gb_payment;	//결제금액(총가격)
	String gb_time;		//결제날짜
	String gb_name; 	//수령인
	String gb_phone;	//연락처
	String gb_email;	//이메일
	String gb_zipaddress;//우편번호
	String gb_address;	//기본주소
	String gb_address2;	//상세주소	
	
}