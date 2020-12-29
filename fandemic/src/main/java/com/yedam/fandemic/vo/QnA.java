package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class QnA {

	String q_no;		//문의번호
	String mem_id;		//회원ID
	String q_title;		//제목
	String q_content;	//내용
	String q_answer;	//답변내용
	String q_time;		//등록일
	String q_atime;		//답변일
	
	String mem_phone;
	
}