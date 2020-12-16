package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Notice {
	
	String noc_no;		//공지번호
	String noc_title;	//공지제목
	String noc_time;	//공지등록일
	String noc_content;	//공지내용
	String noc_file;	//점부파일
		
}
