package com.yedam.fandemic.impl;

import java.util.HashMap;
import java.util.List;

import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Filter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.QnA;

public interface AdminMapper {
	
	
	public List<Filter> filterList(Filter filter);
	public List<Member> memberList(Member member);
	public List<Company> companyList(Company company);
	
	public void filterAdd(Filter filter); // 금칙어 등록
	public int filterSel(Filter filter); // 금칙어 중복확인
	public void filterUpdate(Filter filter); // 금칙어 수정
	public void filterDelete(Filter filter); // 금칙어 삭제
	
	// 페이지네이션
	public int memCount(); //개인
	public int comCount(); //기업
	public int filCount(); //금칙어
	public int qnaCnt(); //qna 
	public int mainQnaCnt(); 
	
	
	
	public List<QnA> qnaList(QnA qna); //qna 리스트
	public QnA qnaOne(QnA qna); //qna 단건
	
	public void answerUpdate(QnA qna);
	
	//메인에 뿌릴 것
	public List<QnA> qnaAnswerNo(QnA qna);
	
	public int memCnt(); 
	public int comCnt();
	public int stCnt(); 
	
	
	//금칙어
	public List<Filter> filBoard();

	
	
}
