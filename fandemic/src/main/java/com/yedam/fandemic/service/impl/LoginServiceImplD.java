package com.yedam.fandemic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.LoginMapperD;
import com.yedam.fandemic.service.LoginServiceD;
import com.yedam.fandemic.vo.Visit;

@Service
public class LoginServiceImplD implements LoginServiceD{

	@Autowired LoginMapperD dao;

	@Override
	public void insertSession(Visit visit) {
		dao.insertSession(visit);
	}


	
	
}
