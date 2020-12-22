package com.yedam.fandemic.impl;


import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Member;

public interface MemberMapper {
	// 멤버 매퍼 아니고 로그인 매퍼 입니다~~~~~~~
	
	
	// 로그인 
	public Member memLogin(Member member); 
	public Company comLogin(Company company); 	// + 스타 로그인 

	
	// 아이디 중복확인
	public int memIdCheck(Member member);  
	public int comIdCheck(Company company);  
	
	
	// 회원가입
	public void memInsert(Member member); 
	public void comInsert(Company company);
	
	
	
	
	
	
	
	
	
	
	
	
}
