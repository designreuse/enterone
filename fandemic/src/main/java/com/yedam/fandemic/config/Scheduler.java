package com.yedam.fandemic.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yedam.fandemic.service.CompanyServiceD;
import com.yedam.fandemic.vo.Notify;

@Component
public class Scheduler {
	@Autowired CompanyServiceD companyService;
	
	
	@Scheduled(fixedRate=600000)
	public void doSomething() {
	    companyService.blackAdd(); //신고당한 내역 count를 토대로 블랙리스트 update
	    System.out.println("60분마다 블랙리스트 업데이트가 됩니다.");
	    companyService.deleteReport(); //블랙 당한놈 신고내역 삭제
	    System.out.println("60분마다 블랙리스트에 따른 신고내역이 업데이트됩니다.");
	   // companyService.DeleteReportList();//black으로 넘어갔으면 신고내역삭제?
	}
}
