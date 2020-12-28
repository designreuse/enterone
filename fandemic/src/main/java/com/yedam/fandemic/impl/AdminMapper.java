package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Filter;
import com.yedam.fandemic.vo.Member;

public interface AdminMapper {
	
	
	public List<Filter> filterList();
	public List<Member> memberList();
	public List<Company> companyList();
	public void filterAdd(Filter filter);
	
	
	
	
	
	
}
