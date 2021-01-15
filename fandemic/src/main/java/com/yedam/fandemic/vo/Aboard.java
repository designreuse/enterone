package com.yedam.fandemic.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Aboard {

	String abo_no;		//오디션게시판번호
	String abo_title;	//게시물제목
	String com_id;		//소속사ID
	String abo_subject;	//게시물말머리
	String abo_time;	//게시물작성일
	String abo_pic;		//게시물 홍보사진
	String abo_content;	//게시물 내용
	String[] abo_nos;    //오디션 공지사항목록 삭제에 필요한 배열, 체크박스받아옴
	
}