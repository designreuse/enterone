package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Audition {

	String aud_no;		//지원번호
	String com_id;		//소속사ID
	String mem_id;		//회원ID
	String abo_no;      //오디션 게시물 번호
	String aud_type;	//지원분야
	String aud_hobby;	//취미/특기
	String aud_height;	//키
	String aud_weight;	//몸무게
	String aud_file;	//대표영상
	String aud_pic;		//대표사진
	
}