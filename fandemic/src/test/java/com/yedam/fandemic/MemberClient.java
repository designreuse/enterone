package com.yedam.fandemic;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.fandemic.config.DBConfiguration;
import com.yedam.fandemic.config.MybatisConfiguration;
import com.yedam.fandemic.impl.MemberMapper;
import com.yedam.fandemic.vo.Member;

import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { DBConfiguration.class,MybatisConfiguration.class } )

public class MemberClient {
	
	@Autowired MemberMapper memMapper;
	private static Logger LOGGER = LoggerFactory.getLogger(Log4j2.class);
	
	
	@Test
	public void deptListTest() {
		List<Member> list = memMapper.memList();
		for(Member mem : list) {
			System.out.println(mem.getMem_id() + " , " + mem.getMem_name());
		}
	}
	
	

}
