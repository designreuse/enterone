package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Company;

public interface CompanyMapper {

	//public int insertCnotice(Cnotice cnotice);
	public List<Company> getCompanyName(Company company);
	public Company getCompanyInfo(Company comapany);
}
