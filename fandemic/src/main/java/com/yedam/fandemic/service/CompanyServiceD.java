package com.yedam.fandemic.service;

import com.yedam.fandemic.vo.Company;

public interface CompanyServiceD {
	public Company getMyCompanyInfo(Company company);//마이페이지에 불러올 회사정보 조회
	public int updateCompanyUpdate(Company company); // 소속사 정보 업데이트
}
