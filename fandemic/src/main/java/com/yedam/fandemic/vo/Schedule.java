package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Schedule {

	String sch_no;		//일련번호
	String st_id;		//스타ID
	String sch_date;	//날짜
	String sch_time;	//시작시간
	String sch_content;	//일정내용
	
}