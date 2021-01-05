package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Letter;
import com.yedam.fandemic.vo.Member;

public interface MypageMapper {

	
//	내정보 수정
	public int memUpdate (Member member);
	
	public int SendMail (Letter letter); //쪽지 보내기
	public int getletterCount(Letter letter); //쪽지 페이지네이션
	public List<Letter> selectMail(Letter letter); // 쪽지 조회하기


}
