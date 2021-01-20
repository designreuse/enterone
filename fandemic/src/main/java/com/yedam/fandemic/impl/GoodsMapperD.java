package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.GoodsCategory;
import com.yedam.fandemic.vo.Star;

public interface GoodsMapperD {
	
	public List<Star> getCompanyStar(Goods goods); //굿즈 등록 소속사 연예인 목록 불러오기.
	public List<GoodsCategory> getCategory();//굿즈 카테고리 받아오기
	public int insertGoods(Goods goods); //굿즈 등록
	public List<Goods> getGoodsList(Goods goods);//굿즈 목록 조회
	public int deleteGoods(Goods goods); //굿즈,행사목록  삭제
	public Goods getGoodsDetail(Goods goods); //굿즈 상세정보 요청
	public int updateGoods(Goods goods); //굿즈,행사 정보 업데이트
	public List<Goods> goodsUntactList(Goods goods);//언택트행사 의 목록만출력
}
