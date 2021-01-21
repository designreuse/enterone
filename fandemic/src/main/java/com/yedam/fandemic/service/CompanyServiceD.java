package com.yedam.fandemic.service;

import java.util.HashMap;
import java.util.List;

import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Gbuyer;
import com.yedam.fandemic.vo.Letter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Notify;
import com.yedam.fandemic.vo.Visit;

public interface CompanyServiceD {
	public Company getMyCompanyInfo(Company company);//마이페이지에 불러올 회사정보 조회
	public int updateCompanyUpdate(Company company); // 소속사 정보 업데이트
	public List<Member> getMemberList(); //쪽지보낼 회원목록
	public int memberCheck(Member member); //쪽지 보낼 회원존재 여부 확인
	public int letterTrans(Letter letter); //쪽지보내기
	public List<Gbuyer> getCharData(Gbuyer gbuyer); //차트에 뿌려줄 데이터
	public List<Gbuyer> getDaySalesList(Gbuyer gbuyer);//일별 매출현황
	public List<Notify> memberReportList(Notify notify); //신고당한놈 리스트 요청
	public int insertVisitor(Visit visit); //방문자수조회
	public Notify notifyDetailR(Notify notify); //신고 상세 댓글
	public Notify notifyDetailF(Notify notify); //신고 상세 게시글
	public int blackRegister(Fan fan); //블랙리스트 직접등록
	public void blackAdd(); //신고 갯수 확인
	public int updateBlack(List<Notify> list); //블랙리스트 업데이트
	public List<HashMap<String, Object>> fanCount(Company company);//팬수 차트
	
}
