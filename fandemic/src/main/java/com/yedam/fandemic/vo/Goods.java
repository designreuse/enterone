package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Goods {

	String go_no;		//상품번호
	String go_name;		//상품명
	String go_price;	//상품가격
	String go_type;		//상품카테고리
	String go_content;	//상품설명
	String com_id;		//소속사ID
	String st_id;		//스타ID
	String go_time;		//등록일
	String go_stock;	//재고
	String go_limited;	//한정판여부
	String go_pic;		//상품대표사진
	String go_detail;	//상품상세사진
	
}