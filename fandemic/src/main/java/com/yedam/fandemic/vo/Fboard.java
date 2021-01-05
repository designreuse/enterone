package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Fboard {

	String fbo_no;		//게시물번호
	String fbo_title;	//게시물제목
	String fbo_subject;	//게시물 말머리
	String st_id;		//스타ID
	String mem_id;		//회원ID
	String fbo_time;	//게시물등록일
	String fbo_content;	//게시물 내용
	String fbo_pic;		//게시물 사진
	String fbo_views;	//조회수
	String fbo_hashtag;	//해시태그
	
	private int cnoc_first; // 페이지네이션
	private int cnoc_last;
}