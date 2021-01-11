package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Gbuyer {

	String gb_no;		//주문번호
	String mem_id;		//회원ID
	String gb_type;		//결제유형
	String go_no;		//상품번호
	String gb_count;	//구매수량
	String gb_payment;	//결제금액(총가격)
	String gb_time;		//결제날짜

	// 2021.01.12 추가 수정 중 (김다희) https://kuzuro.blogspot.com/2018/10/23.html
	String gb_name; //수령인
	String gb_phone;//연락처
	String gb_zipaddress;//우편번호
	String gb_address;//기본주소
	String gb_address2;//상세주소
	
}