package com.yedam.fandemic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Cart {
	
	String cart_no;		// 장바구니 번호
	String mem_id;		// 멤버 id
	String go_no;		// 굿즈 번호
	String cart_qty;	// 수량
	
	String go_name;		// goods.굿즈 이름
	String go_price;	// goods.굿즈 가격
	String go_pic;		// goods.굿즈 대표사진
	String mem_name;	// member.회원 이름
	String ptotal;		// 항목별 합계금액 (가격*수량)
	
//	String mem_phone;		// member.전화번호
//	String mem_email;		// member.이메일
//	String mem_address;		// member.주소
//	String mem_address2;	// member.상세주소
//	String mem_zipaddress;	// member.우편번호
}