package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Sns {

	String sns_no;		//SNS 게시물 번호
	String mem_id;		//회원ID
	String sns_time;	//작성일
	String sns_content;	//내용
	String sns_pic;		//사진
	String sns_likes;	//좋아요 개수
	
}