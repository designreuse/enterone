package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Notify {

	String nof_no;		//신고번호
	String mem_id;		//신고당한사람ID
	String sbo_no;		//게시물번호(스타)
	String fbo_no;		//게시물번호(팬)
	String re_no;		//댓글번호
	String nof_content;	//신고세부사유
	String nof_type;	//신고분류
	String com_id;		//신고 받는 소속사
	String st_id;		//스타 채널 위치
	
	String re_content;   //댓글 내용
	String fbo_content;  //팬게시글 내용
}