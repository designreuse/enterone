package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Fboard;

public interface FboardService {
	public int insertFboard(Fboard fboard);
	public List<Fboard> getFboardList(Fboard fboard);
}
