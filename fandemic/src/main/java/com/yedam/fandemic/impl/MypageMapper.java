package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Letter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.QnA;

public interface MypageMapper {

	
//	내정보 수정
	public int memUpdate (Member member);
	

// 쪽지	
	public int SendMail (Letter letter); //쪽지 보내기
	public int getletterCount(Letter letter); //쪽지 페이지네이션
	public List<Letter> selectMail(Letter letter); // 쪽지 조회하기
	public Letter OneMailSelect (Letter letter); //쪽지 단건 조회
	public int deletemail (Letter letter);	//쪽지 삭제
// 1o1 (qna)
	public int SendQnA (QnA qna); //QnA 보내기
	public int getQnACount(QnA qna); //Qna 페이지네이션
	public List<QnA> selectQnA(QnA qna); // QnA 조회하기
	public QnA OneQnASelect (QnA qna); //QnA 단건 조회
	public int deleteqna (QnA qna);	//QnA 삭제
	
	
}
