package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Member;

public interface MemberMapper {
	// 멤버 매퍼 아니고 로그인 매퍼 입니다~~~~~~~
	
	
	public Member memLogin(Member member); // 개인 로그인
	public Company comLogin(Company company); // 소속사 로그인
	public int memIdCheck(Member member); 
	public int comIdCheck(Company company);
}
