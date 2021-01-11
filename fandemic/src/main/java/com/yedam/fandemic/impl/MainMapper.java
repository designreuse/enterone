package com.yedam.fandemic.impl;

import java.util.HashMap;
import java.util.List;

import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Sns;
import com.yedam.fandemic.vo.Star;


public interface MainMapper {
	
	public List<Goods> ticketList();
	public List<HashMap<String,Object>> fanCount();
	public List<HashMap<String,Object>> myStar3(String id);
	public List<HashMap<String,Object>> myStarList(String id);
	public List<Sns> newSns(String maxNo);
	public List<Sns> todaySns();
	
	//검색
	public List<Star> searchStar(String keyword); //스타
	public List<Company> searchCom(String keyword); //소속사
	
	public List<HashMap<String,Object>> searchAc(String keyword); //연습생
}
