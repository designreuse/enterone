package com.yedam.fandemic.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Sboard {

	String sbo_no;		//게시물번호
	String sbo_title;	//게시물제목
	String st_id;		//스타ID
	String sbo_time;	//게시물등록일
	String sbo_content;	//게시물 내용
	String sbo_hashtag;	//해시태그
	ArrayList<String> sbo_hashtag_array;	//해시태그 배열 분류를 위한 VO

	
	private int sbo_first; // 페이지네이션
	private int sbo_last;
}
