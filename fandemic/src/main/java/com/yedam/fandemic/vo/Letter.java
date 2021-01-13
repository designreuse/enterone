package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Letter {

	String lett_no;			//쪽지번호
	String lett_sid;		//보낸 회원ID
	String mem_id;			//받은 회원ID
	String lett_title;		//쪽지 제목
	String lett_time;		//보낸시간
	String lett_content;	//내용
	
	String snsns; 				//SNS에서 보내는건지 확인
	
	private int lett_first; // 페이지네이션
	private int lett_last;
}