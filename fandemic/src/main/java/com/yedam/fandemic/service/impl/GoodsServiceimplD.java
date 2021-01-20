package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.GoodsMapperD;
import com.yedam.fandemic.service.GoodsServiceD;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.GoodsCategory;
import com.yedam.fandemic.vo.Star;

@Service
public class GoodsServiceimplD implements GoodsServiceD{

	@Autowired GoodsMapperD dao;
	
	@Override
	public List<Star> getCompanyStar(Goods goods) {
		return dao.getCompanyStar(goods);
	}

	@Override
	public List<GoodsCategory> getCategory() {
		return dao.getCategory();
	}

	@Override //굿즈등록
	public int insertGoods(Goods goods) {
		return dao.insertGoods(goods);

	}

	@Override //굿즈 목록조회
	public List<Goods> getGoodsList(Goods goods) {
		return dao.getGoodsList(goods);
	}

	@Override //굿즈,행사 목록 삭제
	public int deleteGoods(Goods goods) {
		return dao.deleteGoods(goods);
	}

	@Override //굿즈 상세정보 요청
	public Goods getGoodsDetail(Goods goods) {
		return dao.getGoodsDetail(goods);
	}

	@Override //굿즈,행사 정보 업데이트
	public int updateGoods(Goods goods) {
		return dao.updateGoods(goods);
	}

	@Override
	public List<Goods> goodsUntactList(Goods goods) {
		return dao.goodsUntactList(goods);
	}
}
