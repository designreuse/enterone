package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Trainee {
	
	String mem_id;		//회원ID
	String tr_name;		//연습생 닉네임
	String tr_pic;		//연습생 프로필사진
	String tr_content;	//연습생 소개
	String tr_branch1;	//지원분야1
	String tr_branch2;	//지원분야2
	
}