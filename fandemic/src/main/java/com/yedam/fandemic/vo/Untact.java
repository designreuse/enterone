package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Untact {

	String unt_no;		//행사번호
	String unt_title;	//행사제목
	String unt_time;	//행사등록일
	String unt_type;	//행사종류
	String unt_price;	//가격
	String unt_stime;	//행사시작일
	String unt_etime;	//행사종료일
	String unt_limit;	//행사제한인원
	String unt_pic;		//행사사진
	String com_id;		//소속사ID
	String unt_content;	//행사내용
	
}