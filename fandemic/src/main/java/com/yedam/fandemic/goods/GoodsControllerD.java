package com.yedam.fandemic.goods;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoodsControllerD {
	
	@RequestMapping(value = "/management/goods/goodsList")
	public String GoodsList() {
		return "mgt/goods/goodsList";
	}
}
