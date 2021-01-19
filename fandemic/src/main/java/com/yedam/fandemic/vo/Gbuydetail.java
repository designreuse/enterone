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
	String gbd_count;	//수량
	
	String mem_id;		//member.회원ID
	String go_type;		//goods.카테고리
}
