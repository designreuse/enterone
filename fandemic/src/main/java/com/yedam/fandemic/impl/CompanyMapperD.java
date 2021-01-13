package com.yedam.fandemic.impl;

import com.yedam.fandemic.vo.Company;

public interface CompanyMapperD {
	public Company getMyCompanyInfo(Company company);//마이페이지에 불러올 회사정보조회
	public int updateCompanyUpdate(Company company); //소속사 정보 업데이트
}
