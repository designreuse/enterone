package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Goods;

public interface GoodsMapper {
	
	// Goods 전체 목록
	public List<Goods> goodsList(Goods goods);
	// Goods 상세 페이지
	public Goods goodsDetail(Goods goods);
}
