package com.yedam.fandemic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Gbuydet {

	String gbd_no;		//주문상세번호
	String gb_no;		//gbuyer.주문번호
	String go_no;		//gbuyer.상품번호
	String gbd_count;	//수량
	
}
