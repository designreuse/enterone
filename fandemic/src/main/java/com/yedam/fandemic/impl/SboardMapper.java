package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Fboard;
import com.yedam.fandemic.vo.Sboard;

public interface SboardMapper {
	public List<Sboard> getSboardList(Sboard sboard);
	public Sboard getSboardInfo(Sboard sboard);
	public Sboard getNewSboard(Sboard sboard);
	public List<Sboard> getSboardHashtagList(Sboard sboard);
	public List<Sboard> getSboardPicList(Sboard sboard);
	public int getSboardCount(Sboard sboard);
	public int insertSboard(Sboard sboard);
	public int updateSboard(Sboard sboard);
	public int deleteSboard(Sboard sboard);
}
