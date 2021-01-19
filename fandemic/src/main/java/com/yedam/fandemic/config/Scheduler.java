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
	    companyService.blackAdd();
		System.out.println("60분마다 블랙리스트 업데이트가 됩니다.");
	}
}
