package com.yedam.fandemic.impl;

import java.util.List;
import java.util.Map;

import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Untact;

public interface UntactMapper {
	
	public String getUntactCode(String go_no); 
	public List<Map<String, Object>> comingsoonList();
	
	//페이징
	public List<Goods> untactList(Untact untact);
	public int unCnt();
	

}
