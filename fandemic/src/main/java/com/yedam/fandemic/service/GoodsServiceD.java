package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.GoodsCategory;
import com.yedam.fandemic.vo.Star;

public interface GoodsServiceD {
	List<Star> getCompanyStar(Goods goods);//굿즈 등록 소속사 연예인 목록 불러오기.
	List<GoodsCategory> getCategory(); //굿즈 카테고리 받아오기.
	String insertGoods(Goods goods); //굿즈 등록하기
	List<Goods> getGoodsList(Goods goods); //굿즈 목록 조회하기
}
