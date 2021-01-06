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

}