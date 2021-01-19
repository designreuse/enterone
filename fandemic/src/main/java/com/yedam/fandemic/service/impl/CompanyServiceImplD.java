package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.CompanyMapperD;
import com.yedam.fandemic.service.CompanyServiceD;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Gbuyer;
import com.yedam.fandemic.vo.Letter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Notify;
import com.yedam.fandemic.vo.Visit;

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

	@Override
	public List<Member> getMemberList() {
		return dao.getMemberList();
	}

	@Override
	public int memberCheck(Member member) {
		return dao.memberCheck(member);
	}

	@Override
	public int letterTrans(Letter letter) {
		return dao.letterTrans(letter);
	}

	@Override
	public List<Gbuyer> getCharData(Gbuyer gbuyer) {
		return dao.getCharData(gbuyer);
	}

	@Override
	public List<Gbuyer> getDaySalesList(Gbuyer gbuyer) {
		return dao.getDaySalesList(gbuyer);
	}

	@Override
	public List<Notify> memberReportList(Notify notify) {
		return dao.memberReportList(notify);
	}

	@Override
	public int insertVisitor(Visit visit) {
		return dao.insertVisitor(visit); //방문자수조회
	}
	
	

}
