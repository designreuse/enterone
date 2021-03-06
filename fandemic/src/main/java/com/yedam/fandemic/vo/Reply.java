package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Reply {
	String re_no;		//댓글번호
	String sfbo_no;		//게시물번호
	String mem_id;		//작성자ID
	String st_id;		//스타ID
	String re_time;		//작성날짜
	String re_content;	//작성내용
	
	String st_name;		//스타이름
	String fan_name;	//닉네임 view로 받아옴
}