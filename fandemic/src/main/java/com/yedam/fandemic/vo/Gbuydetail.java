package com.yedam.fandemic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Gbuydetail {

	String gbd_no;		//주문상세번호
	String gb_no;		//gbuyer.주문번호
	String go_no;		//goods.상품번호
	String cart_qty;	//수량
	
	String mem_id;		//member.회원ID
	
	String gb_time;
	String gb_payment;
	String go_name;
	String go_price;
	String go_pic;
	String go_type;		//goods.카테고리
	String go_untsdate;
	String go_untedate;
	String go_unttime;

	
}
