package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Cnotice;

public interface CnoticeMapper {

	public int insertCnotice(Cnotice cnotice);
	public List<Cnotice> getCnoticeList(Cnotice cnotice);
}
