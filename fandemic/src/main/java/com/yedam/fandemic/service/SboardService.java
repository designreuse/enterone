package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Sboard;

public interface SboardService {
	public List<Sboard> getSboardList(Sboard sboard);
	public Sboard getSboardInfo(Sboard sboard);
	public Sboard getNewSboard(Sboard sboard);
	public List<Sboard> getSboardHashtagList(Sboard sboard);
	public int getSboardCount(Sboard sboard);
	public int insertSboard(Sboard sboard);
	public int updateSboard(Sboard sboard);
	public int deleteSboard(Sboard sboard);
}
