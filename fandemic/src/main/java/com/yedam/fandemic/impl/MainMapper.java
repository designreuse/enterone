package com.yedam.fandemic.impl;

import java.util.HashMap;
import java.util.List;

import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Sns;


public interface MainMapper {
	
	public List<Goods> ticketList();
	public List<HashMap<String,Object>> fanCount();
	public List<HashMap<String,Object>> myStar3(String id);
	public List<HashMap<String,Object>> myStarList(String id);
	public List<Sns> newSns(String maxNo);
	
}
