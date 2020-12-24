package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Star;

public interface CompanyMapper {
	public Company getCompanyTest(Company company);
	public List<Company> getCompanyMinInfo(Company company);
	public Company getCompanyInfo(Company comapany);
	public List<Star> getCompanyStarMin(Star star);
}
