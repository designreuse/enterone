package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Art {

	String art_no;		//작품번호
	String st_id;		//스타ID
	String st_name;     //스타이름
	String art_name;	//작품이름
	String art_type;	//작품분류
	String art_startTime;	//작품시작일
	String art_endTime;  //작품종료일
	String art_pic;		//작품사진
	String art_content;	//작품설명
	String[] art_nos; //작품삭제 
	
}