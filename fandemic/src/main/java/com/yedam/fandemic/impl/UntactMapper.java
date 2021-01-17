package com.yedam.fandemic.impl;

import java.util.List;
import java.util.Map;

import com.yedam.fandemic.vo.Goods;

public interface UntactMapper {
	public List<Goods> untactList();
	public String getUntactCode(String go_no); 
	public List<Map<String, Object>> comingsoonList();

}
