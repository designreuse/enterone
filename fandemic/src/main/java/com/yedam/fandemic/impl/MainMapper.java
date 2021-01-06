package com.yedam.fandemic.impl;

import java.util.HashMap;
import java.util.List;

import com.yedam.fandemic.vo.Goods;


public interface MainMapper {
	
	public List<Goods> ticketList();

	public List<HashMap<String,String>> fanCount();  
	
	
	
	
}
