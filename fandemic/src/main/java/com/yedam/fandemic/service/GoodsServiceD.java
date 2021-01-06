package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.GoodsCategory;
import com.yedam.fandemic.vo.Star;

public interface GoodsServiceD {
	public List<Star> getCompanyStar(Goods goods);//굿즈 등록 소속사 연예인 목록 불러오기.
	public List<GoodsCategory> getCategory(); //굿즈 카테고리 받아오기.
	public int insertGoods(Goods goods); //굿즈 등록하기
	public List<Goods> getGoodsList(Goods goods); //굿즈 목록 조회하기
	public int deleteGoods(Goods goods); //굿즈,행사 목록 삭제하기
	public Goods getGoodsDetail(Goods goods); //굿즈 , 행사 클릭한 상세정보
}
