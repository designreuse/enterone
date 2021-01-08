package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Schedule {

	String sch_no;		//일련번호
	String st_id;		//스타ID
	String sch_title;   //제목
	String sch_startTime;	//시작시간
	String sch_endTime;	//종료시간 
	String sch_type;    //일정구분(무슨행사인지)
	String sch_content;	//일정내용
	String sch_allDay; //하루종일 일정유무
	
}