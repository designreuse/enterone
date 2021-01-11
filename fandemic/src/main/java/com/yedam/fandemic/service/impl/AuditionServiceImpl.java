package com.yedam.fandemic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.AuditionMapper;
import com.yedam.fandemic.service.AuditionService;
import com.yedam.fandemic.vo.Activity;



@Service
public class AuditionServiceImpl implements AuditionService {
	@Autowired AuditionMapper auditionmapper;
	@Override
	public int insertac(Activity activity) {
		// TODO Auto-generated method stub
		return auditionmapper.insertac(activity);
	}
}
