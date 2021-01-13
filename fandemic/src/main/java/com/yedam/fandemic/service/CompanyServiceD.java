package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Member;

public interface CompanyServiceD {
	public Company getMyCompanyInfo(Company company);//마이페이지에 불러올 회사정보 조회
	public int updateCompanyUpdate(Company company); // 소속사 정보 업데이트
	public List<Member> getMemberList(); //쪽지보낼 회원목록
}
