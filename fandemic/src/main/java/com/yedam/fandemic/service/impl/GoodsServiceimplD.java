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

}
