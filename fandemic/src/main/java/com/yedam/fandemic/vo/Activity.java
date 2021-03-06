package com.yedam.fandemic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Activity {

	String ac_no;		//활동게시판 번호
	String ac_title;	//제목
	String mem_id;		//회원ID
	String ac_time;		//작성일
	String ac_content;	//내용
	String ac_hits;		//조회수
	String ac_likes;	//좋아요 카운트
	String ac_file;		//첨부파일
	
	// 페이지네이션
	private int ac_first;	//첫페이지
	private int ac_last;	//마지막페이지
	
}