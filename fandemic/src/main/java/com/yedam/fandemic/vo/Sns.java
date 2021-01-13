package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Sns {

	String sns_no;		//SNS 게시물 번호
	String sns_title;	//SNS TITLE
	String sns_time;	//작성일
	String sns_content;	//내용
	String sns_pic;		//사진
	String sns_likes;	//좋아요 개수
	String mem_id;		//회원ID
	String mem_pic;		//멤버사진
	String mem_type;	//멤버타입
	String mem_time;	//멤버 가입일
	
	
	
	
	//페이지 네이션
	private int sns_first;
	private int sns_last;
}