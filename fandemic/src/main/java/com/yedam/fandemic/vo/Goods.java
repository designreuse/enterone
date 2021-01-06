package com.yedam.fandemic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Goods {
	
	//테이블 합침			// Goods	//Untact
	String go_rnum;		// rownum	
	String go_no;		//상품번호		//행사번호
	String go_name;		//상품명		//행사제목
	String go_price;	//상품가격		//행사가격
	String go_type;		//상품카테고리	//행사종류(TICKET)
	String go_content;	//상품설명		//행사내용
	String com_id;		//소속사ID	//소속사ID
	String st_id;		//스타ID
	String go_time;		//상품등록일	//행사등록일
	String go_stock;	//재고		//행사제한인원
	String go_limited;	//한정판여부
	String go_pic;		//상품대표사진	//행사대표사진
	String go_detail;	//상품상세사진	//행사상세사진
	String go_untsdate;				//행사시작일
	String go_untedate;				//행사종료일
	String go_unttime;				//행사진행시간
	String st_name;    //스타 이름 (추가 2021-01-05 동광희)
	String[] go_nos;   //체크박스 값 담는 필드, 삭제에 사용(추가 2021-01-06 동)
	
	// 페이지네이션
	private int go_first;	//첫페이지
	private int go_last;	//마지막페이지
}