package com.yedam.fandemic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.CompanyMapperD;
import com.yedam.fandemic.service.CompanyServiceD;
import com.yedam.fandemic.vo.Company;

@Service
public class CompanyServiceImplD  implements CompanyServiceD{
	@Autowired CompanyMapperD dao;

	@Override
	public Company getMyCompanyInfo(Company company) {
		return dao.getMyCompanyInfo(company);
	}

	@Override
	public int updateCompanyUpdate(Company company) {
		return dao.updateCompanyUpdate(company);
	}
	
	

}
