package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Star {

	String st_id;			//스타회원ID
	String st_pw;			//패스워드
	String st_name;			//스타이름
	String com_id;			//소속사ID
	String st_icon;			//아이콘사진
	String st_pic;			//프로필사진
	String st_banner;		//배너사진
	String st_introduce;	//스타소개
	String[] st_ids; 		//삭제할 id체크박스여러개 선택 !!!!
	int st_first;			//페이지네이션 처음
	int st_last;			//페이지네이션 마지막
}