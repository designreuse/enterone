package com.yedam.fandemic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Tbuyer {

	// tbuyer
	String tb_no;		//주문번호
	String mem_id;		//member.회원ID
	String tb_payment;	//결제금액(총가격)
	String tb_time;		//결제날짜
	String go_no; 		//goods.상품번호

	String go_name;		//goods.공연제목
	String go_pic;		//goods.공연사진
	String go_untsdate;	//goods.공연시작일
	String go_untedate;	//goods.공연종료일
	String go_unttime;	//goods.공연시간
	
	String com_id; //매출현황에 필요
	
}