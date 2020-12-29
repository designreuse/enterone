package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Cnotice;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Star;

public interface CompanyMapper {
	public List<Company> getCompanyMinInfo(Company company); // 소속사 작은 목록으로 모두 출력
	public Company getCompanyInfo(Company comapany); // 소속사 소개 페이지 출력
	public List<Star> getCompanyStarMin(Star star); //소속사 소속 스타 목록 모두 출력
	
	public int getCnoticeCount(Cnotice cnotice); //공지사항 페이지네이션
	public List<Cnotice> getCnoticeListPaging(Cnotice cnotice); //공지사항 페이지네이션 처리 후 출력
}
