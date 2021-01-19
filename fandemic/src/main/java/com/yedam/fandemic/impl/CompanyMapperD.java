package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Gbuyer;
import com.yedam.fandemic.vo.Letter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Notify;
import com.yedam.fandemic.vo.Visit;

public interface CompanyMapperD {
	public Company getMyCompanyInfo(Company company);//마이페이지에 불러올 회사정보조회
	public int updateCompanyUpdate(Company company); //소속사 정보 업데이트
	public List<Member> getMemberList();//쪽지보낼 회원목록
	public int memberCheck(Member member); //쪽지보낼 회원존재여부 확인
	public int letterTrans(Letter letter); //쪽지보내기
	public List<Gbuyer> getCharData(Gbuyer gbuyer); //차트에 뿌려줄 데이터
	public List<Gbuyer> getDaySalesList(Gbuyer gbuyer); //일별 매출현황 리스트
	public List<Notify> memberReportList(Notify notify); //신고당한놈들 목록 요청
	public int insertVisitor(Visit visit);
}
