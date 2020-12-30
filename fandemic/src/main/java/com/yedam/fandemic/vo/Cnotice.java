package com.yedam.fandemic.vo;


import lombok.Data;

@Data
public class Cnotice {
	String cnoc_sub_no;		//실제 화면에 보여주는 게시글번호
	
	String cnoc_no;			//DB입력 게시글번호
	String com_id;			//소속사ID
	String cnoc_subject;	//게시물말머리
	String cnoc_title;		//게시물제목
	String cnoc_time;		//게시물 등록일
	String cnoc_limit;		//(이벤트) 제한인원
	String cnoc_content;	//게시물 내용
	String cnoc_file;		//게시물 첨부파일
	String conc_banner;		//홍보용 배너
	String[] cnoc_nos; 		//삭제 체크박스들
	
	String cnoc_rn;			
	private int cnoc_first; // 페이지네이션
	private int cnoc_last;
}