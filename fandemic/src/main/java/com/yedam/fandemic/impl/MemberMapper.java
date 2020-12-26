package com.yedam.fandemic.impl;


import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Star;

public interface MemberMapper {
	// 멤버 매퍼 아니고 로그인 매퍼 입니다~~~~~~~
	
	
	// 로그인 
	public Member memLogin(Member member); 
	public Company comLogin(Company company); 	
	public Star starLogin(Star star);
	
	// 아이디 중복확인
	public int memIdCheck(Member member);  
	public int comIdCheck(Company company);  
	
	// 이메일 중복확인
	public int memMailCheck(Member member);  
	public int comMailCheck(Company company); 
	
	
	
	// 회원가입
	public void memInsert(Member member); 
	public void comInsert(Company company);
	
	// id 찾기
	public Member memIdFind(Member member);
	public Company comIdFind(Company company);
	
	// pw 찾기
	public Member memPwFind(Member member);
	public Company comPwFind(Company company);
	
	
	
	
	
	
	
	
	
	
}
