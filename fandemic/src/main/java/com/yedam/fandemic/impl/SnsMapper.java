package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Sns;

public interface SnsMapper {
//SNS INSERT
	public int insertSns(Sns sns); //글자 등록
	//SNS SELECT
	public List<Sns> selectSns(Sns sns);
	//My SNS
	public List<Sns> selectMySns(Sns sns);
}
